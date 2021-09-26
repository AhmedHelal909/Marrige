<?php

namespace App\Http\Resources;

use App\CustomClass\response;
use App\Models\CategoryTranslation;
use Illuminate\Http\Resources\Json\JsonResource;

class employerResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'fullName' => $this->fullName,
            'title' => $this->title,
            'email' => $this->email,
            'mobile_number1' => $this->mobile_number1,
            'mobile_number2' => $this->mobile_number2,
            'company_name' => $this->company_name,
            'country' => $this->country,
            'city' => $this->city,
            'established_at' => $this->established_at,
            'website' => $this->website,
            'active' => $this->active,
            'business' => CategoryTranslation::where('category_id', '=', $this->business)->where('locale', '=', 'en')->select('name', 'description')->first(),
            'image'=> ($this->image != null) ? (url('/') . '/uploads/employer/image/' . $this->image) : (url('/') . '/uploads/employer/image/default.jpg'),
        ];
    }
}
