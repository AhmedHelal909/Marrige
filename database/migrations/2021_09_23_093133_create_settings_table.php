<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('settings', function (Blueprint $table) {
            $table->id();
            $table->string('nat_send');
            $table->string('nat_same');
            $table->string('acco_send');
            $table->string('acco_same');
            $table->boolean('added');
            $table->boolean('visited');
            $table->boolean('added_block');
            $table->boolean('deleted_block');
            $table->boolean('new_message');
            $table->boolean('image_permission');
            $table->boolean('success_story');
            $table->boolean('email_notification');
            $table->bigInteger('husband_id');
            $table->bigInteger('wife_id');
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
        Schema::dropIfExists('settings');
    }
}
