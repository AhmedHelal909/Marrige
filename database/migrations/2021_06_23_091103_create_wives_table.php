<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWivesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('wives', function (Blueprint $table) {
            $table->id();
            $table->string('user_name');
            $table->string('password');
            $table->string('email')->unique();
            $table->string('nationality');
            $table->bigInteger('country_id');
            $table->string('marrige_type');
            $table->string('social_status');
            $table->string('age');
            $table->string('child_no');
            $table->string('weight');
            $table->string('height');
            $table->string('skin_color');
            $table->string('physique');
            $table->string('religiosity');
            $table->string('pray');
            $table->string('smoke');
            $table->string('hijab');
            $table->string('educational_equal');
            $table->string('financial_status');
            $table->string('work');
            $table->string('job');
            $table->string('health_status');
            $table->string('monthly_income');
            $table->text('partner_specification');
            $table->text('self_description');
            $table->string('fullname');
            $table->string('phone');
            $table->string('image');
            $table->string('token_firebase')->nullable();
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
        Schema::dropIfExists('wives');
    }
}
