<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateIslemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('islems', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('tip')->default(0);
            $table->integer('musteriId');
            $table->integer('faturaId')->default(0);
            $table->double('fiyat');
            $table->date('tarih');
            $table->integer('Hesap');
            $table->integer('odemeSekli');
            $table->text('aciklama')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('islems');
    }
}
