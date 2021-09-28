<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;



Route::get('/clear-cache',function(){
    Artisan::call('config:cache');
    Artisan::call('cache:clear');
    // Artisan::call('jwt:secret');
    return "cache clear";
});

// Route::post('register', 'Api\site\register@registerEmployee');
//register Husband 
Route::post('register', 'Api\site\register@registerHusband');
Route::post('login', 'Api\site\authentication@authenticate')->name('husband');
Route::group(['middleware' => ['auth_hus'],
'prefix'=>'husband',
  ], function() {
Route::get('profile', 'Api\site\profileController@getProfile')->name('husband');
Route::post('logout', 'Api\site\authentication@logout')->name('husband');
Route::post('updateProfile', 'Api\site\profileController@updateHusbandProfile');


});
Route::post('forgetPassword', 'Api\site\resetPassword@sendEmail')->name('husband');


//register wife
Route::post('registerwife', 'Api\site\register@registerWife');
Route::post('loginwife', 'Api\site\authentication@authenticate')->name('wife');
Route::group(['middleware' => ['auth_wife'],
'prefix'=>'wife',
  ], function() {
Route::get('profile', 'Api\site\profileController@getProfile')->name('wife');
Route::post('logout', 'Api\site\authentication@logout')->name('wife');
Route::post('updateProfile', 'Api\site\profileController@updateWifeProfile');

});





Route::post('register/socialite', 'Api\site\register@socialiteRegisterEmployee');

// Route::post('login', 'Api\site\authentication@authenticate')->name('employee');
Route::post('login/socialite', 'Api\site\authentication@socialiteAuthenticate');

// Route::post('forgetPassword', 'Api\site\resetPassword@sendEmail')->name('employee');
Route::post('changePassword', 'Api\site\resetPassword@passwordResetProcess')->name('employee');

Route::group(['middleware' => ['auth_emp']], function() {
    Route::get('profile', 'Api\site\profileController@getProfile')->name('employee');
    Route::post('logout', 'Api\site\authentication@logout')->name('employee');
    Route::post('updateProfile', 'Api\site\profileController@updateEmployeeProfile');

    //active   
    Route::post('sendActiveMail', 'Api\site\activeAccount@sendEmail')->name('employee');
    Route::post('active', 'Api\site\activeAccount@active')->name('employee');

    //mian Page
    Route::get('mainPage', 'Api\site\employee@mainPage');
    Route::get('category/job', 'Api\site\employee@jobCategory');
    

    //my jobs
    Route::get('jobDetails', 'Api\site\employee@jobDetails');

    Route::post('job/apply', 'Api\site\employee@applyforJob');
    Route::get('availableMeetings', 'Api\site\employee@availableMeetings');
    Route::post('job/acceptOffer', 'Api\site\employee@acceptOffer');
    Route::post('job/acceptOffer/edit', 'Api\site\employee@accept_offer_with_author_meeting');
    Route::get('companyDetails', 'Api\site\employee@companyDetails');

    Route::get('myJobs', 'Api\site\employee@myJobs');
    Route::get('mySchedule', 'Api\site\employee@mySchedule');


    //my jobs meetings
    Route::get('myCandat', 'Api\site\employee@myCandat');
    Route::get('myRooms', 'Api\site\employee@myMeetings');

    //chat
    Route::get('chat/mySchedule', 'Api\site\employee@myScheduleChat');
    Route::post('chat/make', 'Api\site\employee@makeChat');

    //notification
    Route::get('notification', 'Api\site\employee@getEmplyeeNotification');
});



Route::group(['prefix' => 'employer'], function() {
    Route::post('login', 'Api\site\authentication@authenticate')->name('employer');
    Route::post('register', 'Api\site\register@registerEmpolyer')->name('employer');
    Route::post('forgetPassword', 'Api\site\resetPassword@sendEmail')->name('employer');
    Route::post('changePassword', 'Api\site\resetPassword@passwordResetProcess')->name('employer');

    Route::group(['middleware' => ['auth_empr']], function() {
        Route::get('test', 'Api\site\Controller@show');
        Route::get('profile', 'Api\site\profileController@getProfile')->name('employer');
        Route::post('logout', 'Api\site\authentication@logout')->name('employer');
        Route::post('updateProfile', 'Api\site\profileController@updateEmployerProfile');

        //main page
        Route::get('mainPage', 'Api\site\employer@mainPage');
        Route::get('jobDetails', 'Api\site\guestController@jobDetails');

        //myScedule
        Route::get('mySchedule', 'Api\site\employer@schedule');
        Route::get('meetingSummary', 'Api\site\employer@meetingSummary');

        //active
        Route::post('sendActiveMail', 'Api\site\activeAccount@sendEmail')->name('employer');
        Route::post('active', 'Api\site\activeAccount@active')->name('employer');

        //report
        Route::post('report', 'Api\site\employer@report');
        Route::get('review', 'Api\site\employer@review');

        //job
        Route::post('newJob', 'Api\site\employer@newjob');
        Route::post('jobEdit', 'Api\site\employer@jobEdit');
        Route::post('JobDelete', 'Api\site\employer@JobCanceled');
        Route::get('employee/profile', 'Api\site\employer@employeeProfile');

        //Candats
        Route::get('myCandat', 'Api\site\employer@myCandat');
        Route::get('employees', 'Api\site\employer@employees');

        Route::get('myCandat/live', 'Api\site\employer@meetingLive');
        Route::get('myCandat/accepted', 'Api\site\employer@acceptedEmployee');

        
        Route::post('candat/accept-reject', 'Api\site\employer@acceptRejectCandat');
        Route::get('availableMeetings', 'Api\site\employer@availableMeetings');

        //chat
        Route::get('chat/mySchedule', 'Api\site\employer@myScheduleChat');
        Route::post('chat/make', 'Api\site\employer@makeChat');

        //make meeting
        Route::post('makeVideo', 'Api\site\employer@makeVideo');
    });
});


Route::group(['prefix' => 'guest'], function() {
    Route::get('mainPage', 'Api\site\guestController@mainPage');
    Route::get('jobDetails', 'Api\site\guestController@jobDetails');
    Route::get('categories', 'Api\site\guestController@categories');
});
//husband 
