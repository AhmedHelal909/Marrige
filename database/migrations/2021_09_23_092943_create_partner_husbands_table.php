<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePartnerHusbandsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('partner_husbands', function (Blueprint $table) {
            $table->id();
            $table->string('nationality');
            $table->bigInteger('country_id');
            $table->string('marrige_type');
            $table->string('social_status');
            $table->string('skin_color');
            $table->string('physique');
            $table->string('educational_equal');
            $table->string('financial_status');
            $table->string('work');
            $table->string('year_income');
            $table->string('religiosity');
            $table->string('pray');
            $table->string('smoke');
            $table->string('beard');
            $table->string('type');
            $table->string('age_from');
            $table->string('age_to');
            $table->string('weight_from');
            $table->string('weight_to');
            $table->string('height_from');
            $table->string('height_to');
            $table->bigInteger('husband_id');
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
        Schema::dropIfExists('partner_husbands');
    }
}
