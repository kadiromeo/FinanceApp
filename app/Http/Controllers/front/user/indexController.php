<?php

namespace App\Http\Controllers\front\user;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;
use App\Http\Controllers\Controller;
use App\User;
use App\Logger;


class indexController extends Controller
{
    public function index()
    {
        return view('front.user.index');
    }

    public function create()
    {
        return view('front.user.create');
    }

    public function store(Request $request)
    {
        $all = $request->except('_token');
        $c=User::where('email',$all['email'])->count();
        if($c==0)
        {

            $all['password']=md5($all['password']);
            $create = User::create($all);

            if($create)
            {
                Logger::Insert($all['name']." Kullanıcı Eklendi","Ürün");
                return redirect()->back()->with('status','Kullanıcı Başarı ile Eklendi');
            }
            else
            {
                return redirect()->back()->with('status','Kullanıcı Eklenemedi');
            }
        }else{
            return redirect()->back()->with('status','Email Sistemde Mevcut');
        }
    }

    public function edit($id)
    {
        $c = User::where('id',$id)->count();
        if($c !=0)
        {
            $data = User::where('id',$id)->get();
            return view('front.user.edit',['data'=>$data]);
        }
        else
        {
            return redirect('/');
        }
    }

    public function update(Request $request)
    {
        $id = $request->route('id');
        $c = User::where('id',$id)->count();
        if($c !=0)
        {
            $all = $request->except('_token');
            $data = User::where('id',$id)->get();

            $update = User::where('id',$id)->update($all);
            if($update)
            {
                Logger::Insert($data[0]['name']." Kullanıcı Düzenlendi","Kullanıcı");
                return redirect()->back()->with('status','Kullanıcı Düzenlendi');
            }
            else
            {
                return redirect()->back()->with('status','Kullanıcı Düzenlenemedi');
            }
        }
        else
        {
            return redirect('/');
        }
    }


    public function delete($id)
    {
        $c = User::where('id',$id)->count();
        if($c !=0)
        {
            $data = User::where('id',$id)->get();
            Logger::Insert($data[0]['name']." Ürün Silindi","Kullanıcı");
            User::where('id',$id)->delete();
            return redirect()->back();
        }
        else
        {
            return redirect('/');
        }
    }


    public function data(Request $request)
    {
        $table = User::query();
        $data = DataTables::of($table)
            ->addColumn('edit',function ($table){
                return '<a href="'.route('user.edit',['id'=>$table->id]).'">Düzenle</a>';
            })
            ->addColumn('delete',function ($table){
                return '<a href="'.route('user.delete',['id'=>$table->id]).'">Sil</a>';
            })
            ->rawColumns(['edit','delete'])
            ->make(true);
        return $data;
    }
}
