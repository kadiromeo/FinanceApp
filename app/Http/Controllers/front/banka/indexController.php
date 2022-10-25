<?php

namespace App\Http\Controllers\front\banka;
use App\FaturaIslem;
use App\Helper\fileUpload;
use App\Logger;
use App\Musteriler;
use App\Kalem;
use App\Banka;
use App\Rapor;
use App\Islem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;
use App\Http\Controllers\Controller;

class indexController extends Controller
{
    public function index(){
        return view('front.banka.index');
    }

    public function create(){
        return view('front.banka.create');
    }

    public function store(Request $request){
        $all = $request->except('_token');
        $create = Banka::create($all);
        if($create)
        {
            return redirect()->back()->with('status','banka Başarı ile Eklendi');
        }
        else
        {
            return redirect()->back()->with('status','banka Eklenemedi');
        }
    }

    public function edit($id){

        $c=Banka::where('id',$id)->count();
        if($c!=0)
        {
            $data=Banka::where('id',$id)->get();
            return view('front.banka.edit',['data'=>$data]);
        }else{
            return redirect('/');
        }
    }

    public function update(Request $request){
        $id=$request->route('id');
        $c=Banka::where('id',$id)->count();
        if($c!=0)
        {
            $all = $request->except('_token');
            $data = Banka::where('id',$id)->get();
            $update = Banka::where('id',$id)->update($all);
            if($update)
            {
                return redirect()->back()->with('status','banka Düzenlendi...!');
            }
            else{
                return redirect()->back()->with('status','banka Düzenlenemedi...X');
            }
        }
        else{
        }
    }

    public function delete($id){
        $c=Banka::where('id',$id)->count();
        if($c!=0)
        {
            $data=Banka::where('id',$id)->get();
            Banka::where('id',$id)->delete();
            return redirect()->back();
        }else{
            return redirect('/');
        }
    }

    public function data(Request $request){
        $table = Banka::query();
        $data = DataTables::of($table)
            ->addColumn('edit',function ($table){
                return '<a href="'.route('banka.edit',['id'=>$table->id]).'">Düzenle</a>';
            })

            ->addColumn('delete',function ($table){
                return '<a href="'.route('banka.delete',['id'=>$table->id]).'">Sil</a>';
            })

            ->rawColumns(['edit','delete'])
            ->make(true);
        return $data;
    }
}
