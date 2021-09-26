<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class WifeResource extends JsonResource
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
            return[
                'user_name'          => $this->user_name,
                'email'             => $this->email,
                'password'          => Hash::make($this->password),
                'country_id'           => $this->country_id,
                'marrige_type'           => $this->marrige_type,
                'social_status'           => $this->social_status,
                'age'           => $this->age,
                'child_no'           => $this->child_no,
                'weight'           => $this->weight,
                'height'           => $this->height,
                'skin_color'           => $this->skin_color,
                'physique'           => $this->physique,
                'religiosity'           => $this->religiosity,
                'pray'           => $this->pray,
                'smoke'           => $this->smoke,
                'hijab'           => $this->hijab,
                'educational_equal'           => $this->educational_equal,
                'financial_status'           => $this->financial_status,
                'health_status'           => $this->health_status,
                'monthly_income'           => $this->monthly_income,
                'partner_specification'           => $this->partner_specification,
                'self_description'           => $this->self_description,
                'fullname'           => $this->fullname,
                'phone'           => $this->phone,
                'job'           => $this->job,
                'work'           => $this->work,
                'nationality'           => $this->nationality,
                'token_firebase'        =>$this->token_firebase,
                'image'                 =>($this->image != null) ? (url('/') . '/uploads/wives/' . $this->image) : (url('/') . '/uploads/wives/default.jpg'),
                
            ];
        ];
    }
}
