@extends('layouts.app')
@section('content')
    <!-- Page Title Area -->
    <div class="row page-title clearfix">
        <div class="page-title-left">
            <h6 class="page-title-heading mr-0 mr-r-5">Profil</h6>
        </div>
        <!-- /.page-title-left -->
        <div class="page-title-right d-none d-sm-inline-flex">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Panel</a>
                </li>
                <li class="breadcrumb-item active">Profil</li>
            </ol>
        </div>
        <!-- /.page-title-right -->
    </div>
    <!-- /.page-title -->
    <!-- =================================== -->
    <!-- Different data widgets ============ -->
    <!-- =================================== -->
    <div class="widget-list">
        <div class="row">
            <div class="col-12 col-md-12 mr-b-30">
                <ul class="nav nav-tabs contact-details-tab">
                    <li class="nav-item"><a href="#profile-tab-bordered-1" class="nav-link active" data-toggle="tab">Pofil Düzenle</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <!-- /.tab-pane -->
                    <div role="tabpanel" class="tab-pane active" id="profile-tab-bordered-1">
                        <div class="contact-details-profile">
                            <h5 class="mr-b-20">Profil Düzenle</h5>
                            <form action="{{route('profil.update')}}" method="POST">
                                @csrf
                                <div class="row">

                                    <div class="col-md-12">
                                        <div class="contact-details-cell"><small class="heading-font-family fw-500">Ad Soyad</small>
                                            <input type="text" class="form-control" value="{{Auth::user()->name}}">
                                        </div>
                                        <!-- /.contact-details-cell -->
                                    </div>
                                    <!-- /.col-md-6 -->
                                    <div class="col-md-12">
                                        <div class="contact-details-cell"><small class="heading-font-family fw-500">Email </small>
                                            <input type="text" class="form-control" value="{{Auth::user()->email}}">

                                        </div>
                                        <!-- /.contact-details-cell -->
                                    </div>
                                    <!-- /.col-md-6 -->
                                    <div class="col-md-12">
                                        <div class="contact-details-cell"><small class="heading-font-family fw-500">Şifre</small>
                                            <input type="password" class="form-control" value="" name="password">

                                        </div>
                                        <!-- /.contact-details-cell -->
                                    </div>
                                    <!-- /.col-md-6 -->
                                    <div class="col-md-6">
                                        <button class="btn btn-primary">Kaydet</button>
                                        <!-- /.contact-details-cell -->
                                    </div>
                                    <!-- /.col-md-6 -->
                                </div>
                            </form>
                            <!-- /.row -->
                            <!-- /.row -->
                        </div>
                        <!-- /.contact-details-profile -->
                        <!-- /.row -->
                    </div>
                    <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
            </div>
            <!-- /.col-sm-8 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.widget-list -->
@endsection
