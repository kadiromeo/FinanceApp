@extends('layouts.app')
@section('content')

<div class="row page-title clearfix">
    <div class="page-title-left">
        <h6 class="page-title-heading mr-0 mr-r-5">Müşteriler</h6>
    </div>
    <!-- /.page-title-left -->
    <div class="page-title-right d-none d-sm-inline-flex">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Panel</a>
            </li>
            <li class="breadcrumb-item active">Müşteriler</li>
        </ol>
        <div class="d-none d-md-inline-flex justify-center align-items-center"><a href="javascript: void(0);" class="btn btn-color-scheme btn-sm fs-11 fw-400 mr-l-40 pd-lr-10 mr-l-0-rtl mr-r-40-rtl hidden-xs hidden-sm ripple" target="_blank">Yeni Müşteri Ekle</a>
        </div>
    </div>
    <!-- /.page-title-right -->
</div>

@if (session("status"))
<div class="row mt-3">
    <div class="col-md-12">
        <div class="alert alert-success">{{session('status')}}</div>
    </div>
</div>
@endif


<div class="widget-list">
    <div class="row">
        <div class="col-md-12 widget-holder">
            <div class="widget-bg">
                <div class="widget-body clearfix">
                    <form enctype="multipart/form-data" action="{{route('musteriler.store')}}" method="post">
                        @csrf

                        <div class="form-group row">
                            <div class="col-md-12">
                               <label class=" col-form-label">Müşteri Resmi</label>
                                <input class="form-control" type="file">
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="" class="col-form-label">Müşteri Tipi</label>
                                <div>
                                    <input class="change-customerType" checked type="radio" name="musteriTipi" value="0"> Bireysel
                                </div>
                                <div>
                                    <input class="change-customerType"  type="radio" name="musteriTipi" value="1"> Kurumsal
                                </div>
                            </div>
                        </div>

                        <div class="form-group row firma-area">
                            <div class="col-md-4">
                                <label class="col-form-label" for="l0">Firma Adı</label>
                                    <input name="firmaAd" class="form-control"  type="text">
                            </div>

                            <div class="col-md-4">
                                <label class="col-form-label" for="l0">Vergi Numarası</label>
                                    <input name="vergiNumara" class="form-control"  type="text">
                            </div>

                            <div class="col-md-4">
                                <label class="col-form-label" for="l0">Vergi Dairesi</label>
                                    <input name="vergiDaire" class="form-control"  type="text">
                            </div>
                        </div>


                        <div class="form-group row">
                            <div class="col-md-6">
                                <label class="col-form-label" for="l0">Ad</label>
                                    <input name="ad" class="form-control"  type="text">
                            </div>

                            <div class="col-md-6">
                                <label class="col-form-label" for="l0">Soyad</label>
                                    <input name="soyad" class="form-control"  type="text">
                            </div>
                        </div>


                        <div class="form-group row">
                            <div class="col-md-6">
                                <label class="col-form-label" for="l0">Doğum Tarihi</label>
                                    <input name="dogumTarih" class="form-control" type="date">
                            </div>

                            <div class="col-md-6">
                                <label class="col-form-label" for="l0">TC</label>
                                    <input name="tc" class="form-control"  type="text">
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-4">
                                <label class="col-form-label" for="l0">Adres</label>
                                    <input name="adres" class="form-control" type="text">
                            </div>

                            <div class="col-md-4">
                                <label class="col-form-label" for="l0">Telefon</label>
                                    <input name="telefon" class="form-control"  type="text">
                            </div>
                            <div class="col-md-4">
                                <label class="col-form-label" for="l0">Email</label>
                                    <input name="email" class="form-control"  type="text">
                            </div>
                        </div>

                        <div class="form-actions">
                            <div class="form-group row">
                                <div class="col-md-12 ml-md-auto btn-list">
                                    <button class="btn btn-primary btn-rounded" type="submit">Müşteri Ekle</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- /.widget-body -->
            </div>
            <!-- /.widget-bg -->
        </div>

        <!-- /.widget-holder -->
    </div>
    <!-- /.row -->
</div>
@endsection

@section('footer')
<script>
    $(".change-customerType").click(function(){
        var value = $(this).val();
        if(value == 1)
        {
           $(".firma-area").show();
        }else{
            $(".firma-area").hide();

        }
    });
    </script>
@endsection
