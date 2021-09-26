{{ csrf_field() }}
@php
    $marrige_type = [
        'زوجة اولى',
        'زوجة ثانية',
];
$social_status = [
    'اعزب',
    'متزوج',
    'مطلق',
    'ارمل',
];
$skin_color = [
    'ابيض',
    'حنطي مائل للبياض',
    'حنطي مائل للسمار',
    'اسمر فاتح',
    'سمر غامق',
    'اسود',
];
$physique = [
    'نحيف/رفيع',
    'متوسط البنية',
    'قوام رياضي',
    'سمين',
    'غامق',
    
];
$religiosity = [
 'لست متدين',
 'متدين قليلا',
 'متدين',
 'متدين كثيرا',
 'أفضل أن لا أقول ',
];
$pray = [
    'أصلي دائما',
    'أصلي أغلب الأوقات',
    'أصلي بعض الوقت',
    'لا أصلي ',
    ' أفضل أن لاأقول',
];
$educational_equal = [
    'دراسة متوسطة',
    'دراسة ثانوية',
    'دراسة جامعية',
    'دكتوراه',
    'دراسة ذاتية',
];
$financial_status =[
    'فقير',
    'اقل من المتوسط',
    'متوسط',
    'أكثر من متوسط',
    'جيد',
    'ميسور',
    'غني',
];
$work = [
    'بدون عمل حاليا',
    'لازلت أدرس',
    'سكرتارية',
    'مجال الفن / الأدب',
    'الإدارة',
    'مجال التجارة',
    'مجال الأغذية',
    'مجال الانشاءات والبناء',
    'مجال القانون ',
    'مجال الطب ',
    'السياسة / الحكومة',
    'متقاعد',
    'التسويق والمبيعات',
    'صاحب عمل خاص',
    'مجال التدريس',
    'مجال النقل ',
    'مجال الكمبيوتر أو المعلومات / ',
    'شيء آخر',
];
$health_status = [
    'سليم والحمد لله',
    'اعاقة حركية',
    'اعاقة فكرية',
    'اكتئاب',
    'انحناء وتقوس',
    'انفصام',
    'باطنية',
    'برص',
    'بصرية',
    'بهاق',
    'جلدية',
    'حروق مشوهة',
    'سكري',
    'سمعية',
    'كلامية - نطق',
    'سمية مفرطة',
    'شلل أطفال',
    'شلل رباعي',
    'شلل نصفي',
    'صدفية',
    'صرع',
    'عجز جنسي',
    'عقم',
    ' فقدان طرف أو عضو',
    'متلازمة داون',
    'نفسية',
  
];
$monthly_income = [
    'بدون دخل',
    'أقل من 500 جنيه',
    '500-1000 جنيه',
    '1000-3000 جنيه',
    '3000-6000 جنيه',
    '6000-9000 جنيه',
    '9000-12000 جنيه',
    '12000-16000 جنيه',
    '16000-20000 جنيه',
    'أكثر من 20000 جنيه',
    'لا أحب ان أقول',
];
@endphp
<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.user_name')</label>
        <input type="text" class="form-control  @error('user_name') is-invalid @enderror" name="username"
            value="{{ isset($row) ? $row->user_name : old('user_name') }}">
        @error('user_name')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.password')</label>
        <input type="password" class="form-control  @error('password') is-invalid @enderror" name="password" value="">
        @error('password')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>

<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.password_confirmation')</label>
        <input type="password" class="form-control  @error('password_confirmation') is-invalid @enderror"
            name="password_confirmation" value="">
        @error('password_confirmation')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.email')</label>
        <input type="email" class="form-control  @error('email') is-invalid @enderror" name="email"
            value="{{ isset($row) ? $row->email : old('email') }}">
        @error('email')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.nationality')</label>
        <input type="text" class="form-control  @error('nationality') is-invalid @enderror" name="username"
            value="{{ isset($row) ? $row->nationality : old('nationality') }}">
        @error('nationality')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>

<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.country')</label>
        <input type="text" class="form-control  @error('country') is-invalid @enderror" name="country"
            value="{{ isset($row) ? $row->country : old('country') }}">
        @error('country')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>




<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.city')</label>
        <input type="text" class="form-control  @error('city') is-invalid @enderror" name="city"
            value="{{ isset($row) ? $row->city : old('city') }}">
        @error('city')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.marrige_type')</label>
        <select name="marrige_type" class='form-control'>
            
                <option value="اختار نوع الزوجة"> 
                    اختار نوع الزوجة
                </option>
                @foreach ( $marrige_type as $index=>$type )
                    
                <option value="{{$index}}" @if(isset($row) && $row->marrige_type==$index) selected @endif>{{$type}}</option>
                @endforeach
                {{-- <option value="2" @if(isset($row) && $row->marrige_type==2) selected @endif>زوجة ثانية</option> --}}
              
        </select>
        @error('marrige_type')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.social_status')</label>
        <select name="social_status" class='form-control'>
            
                <option > 
                    اختار الحالة الاجتماعية
                </option>
                @foreach ( $social_status as $index=>$social )
                    
                <option value="{{$index}}" @if(isset($row) && $row->social_status==$index) selected @endif>{{$social}}</option>
                @endforeach
               
              
        </select>
        @error('social_status')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.age')</label>
        <select name="age" class='form-control'>
            <option > 
                اختار العمر 
            </option>
            @for($i=21;$i<=90;$i++)
                <option value="{{$i}}" @if(isset($row) && $row->age==$i) selected @endif>{{$i}}</option>
            @endfor    
        </select>
        @error('age')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.child_no')</label>
        <select name="child_no" class='form-control'>
            <option > 
                اختار عدد الاطفال 
            </option>
            @for($i=0;$i<=8;$i++)
                <option value="{{$i}}" @if(isset($row) && $row->child_no==$i) selected @endif>{{$i}}</option>
            @endfor    
        </select>
        @error('child_no')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.weight')</label>
        <select name="weight" class='form-control'>
            <option > 
                ماهو وزنك   
            </option>
            @for($i=30;$i<=160;$i++)
                <option value="{{$i}}" @if(isset($row) && $row->weight==$i) selected @endif>{{$i}}</option>
            @endfor    
        </select>
        @error('weight')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.height')</label>
        <select name="height" class='form-control'>
            <option > 
                ماهو طولك   
            </option>
            @for($i=130;$i<=225;$i++)
                <option value="{{$i}}" @if(isset($row) && $row->height==$i) selected @endif>{{$i}}</option>
            @endfor    
        </select>
        @error('height')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.skin_color')</label>
        <select name="skin_color" class='form-control'>
            <option > 
                اختار لون البشرة  
            </option>
        </option>
        @foreach ( $skin_color as $index=>$skin )
            
        <option value="{{$index}}" @if(isset($row) && $row->skin_color==$index) selected @endif>{{$skin}}</option>
        @endforeach
        </select>
        @error('skin_color')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.physique')</label>
        <select name="physique" class='form-control'>
            <option > 
                بنية الجسم    
            </option>
            @foreach ( $physique as $index=>$phy )
            
        <option value="{{$index}}" @if(isset($row) && $row->physique==$index) selected @endif>{{$phy}}</option>
        @endforeach
            
        </select>
        @error('physique')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.religiosity')</label>
        <select name="religiosity" class='form-control'>
            <option > 
                --اختر--     
            </option>
            @foreach ( $religiosity as $index=>$relig )
            
            <option value="{{$index}}" @if(isset($row) && $row->religiosity==$index) selected @endif>{{$relig}}</option>
            @endforeach
        </select>
        @error('religiosity')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.pray')</label>
        <select name="pray" class='form-control'>
            <option > 
                --اختر--     
            </option>
            @foreach ( $pray as $index=>$pray )
            
            <option value="{{$index}}" @if(isset($row) && $row->pray==$index) selected @endif>{{$pray}}</option>
            @endforeach

        </select>
        @error('pray')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.smoke')</label>
        <select name="smoke" class='form-control'>
            <option > 
                --اختر--     
            </option>
            <option value="1" @if(isset($row) && $row->smoke==1) selected @endif>لا</option>
            <option value="2" @if(isset($row) && $row->smoke==2) selected @endif>نعم</option>
        </select>
        @error('smoke')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.beard')</label>
        <select name="beard" class='form-control'>
            <option > 
                --اختر--     
            </option>
            <option value="0" @if(isset($row) && $row->beard==1) selected @endif>لا</option>
            <option value="1" @if(isset($row) && $row->beard==2) selected @endif>نعم</option>
        </select>
        @error('beard')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.educational_equal')</label>
        <select name="educational_equal" class='form-control'>
            <option > 
              اختار المؤهل التعليمي    
            </option>
            @foreach ( $educational_equal as $index=>$educational_equal )
            
            <option value="{{$index}}" @if(isset($row) && $row->educational_equal==$index) selected @endif>{{$educational_equal}}</option>
            @endforeach
        </select>
        @error('educational_equal')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.financial_status')</label>
        <select name="financial_status" class='form-control'>
            <option > 
            وضعك المادي    
            </option>
            @foreach ( $financial_status as $index=>$financial_status )
            
            <option value="{{$index}}" @if(isset($row) && $row->financial_status==$index) selected @endif>{{$financial_status}}</option>
            @endforeach
          
        </select>
        @error('financial_status')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.work')</label>
        <select name="work" class='form-control'>
            <option > 
            وضعك المادي    
            </option>
            @foreach ( $work as $index=>$work )
            
            <option value="{{$index}}" @if(isset($row) && $row->work==$index) selected @endif>{{$work}}</option>
            @endforeach
        </select>
        @error('work')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.job')</label>
        <input type="text" class="form-control  @error('job') is-invalid @enderror" name="job"
            value="{{ isset($row) ? $row->job : old('job') }}">
        @error('job')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-2">
    <div class="form-group">
        <label>@lang('site.health_status')</label>
        <select name="health_status" class='form-control'>
            <option > 
            وضعك المادي    
            </option>
            @foreach ( $health_status as $index=>$health_status )
            
            <option value="{{$index}}" @if(isset($row) && $row->health_status==$index) selected @endif>{{$health_status}}</option>
            @endforeach
           
        </select>
        @error('health_status')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-12">
    <div class="form-group">
        <label>@lang('site.monthly_income')</label>
        <select name="monthly_income" class='form-control'>
            <option > 
            دخلك الشهري 
            </option>
            @foreach ( $monthly_income as $index=>$monthly_income )
            
            <option value="{{$index}}" @if(isset($row) && $row->monthly_income==$index) selected @endif>{{$monthly_income}}</option>
            @endforeach
           
            
        </select>
        @error('monthly_income')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>

<div class="col-md-2"></div>
<div class="form-group">
    <label for="exampleFormControlTextarea1">مواصفات شريكك</label>
    <textarea class="form-control" id="partner_specification" rows="3"  @error('partner_specification') is-invalid @enderror" name="partner_specification" 
    value="{{ isset($row) ? $row->partner_specification : old('partner_specification') }}"
    ></textarea>
    @error('partner_specification')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
  </div>
  
    
</div>
<div class="col-md-2"></div>
<div class="form-group">
    <label for="exampleFormControlTextarea1">تحدث عن نفسك</label>
    <textarea class="form-control" id="self_description" rows="3"  @error('self_description') is-invalid @enderror" name="self_description" 
    value="{{ isset($row) ? $row->self_description : old('self_description') }}"
    ></textarea>
    @error('self_description')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
  </div>
  
    
</div>

<div class="col-md-4">
    <div class="form-group">
        <label>@lang('site.fullname')</label>
        <input type="text" class="form-control  @error('fullname') is-invalid @enderror" name="fullname"
            value="{{ isset($row) ? $row->fullname : old('fullname') }}">
        @error('fullname')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-4">
    <div class="form-group">
        <label>@lang('site.phone')</label>
        <input type="text" class="form-control  @error('phone') is-invalid @enderror" name="phone"
            value="{{ isset($row) ? $row->phone : old('phone') }}">
        @error('phone')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-4">
    <div class="form-group">
        <label>@lang('site.image')</label>
        <input type="file" name="image" class="form-control  @error('image') is-invalid @enderror">
        @error('image')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>





