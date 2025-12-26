<?php
namespace common\models\login;

use common\models\Applicant;
use dektrium\user\models\User as BaseUser;

/**
 * User model
 *
 * @property integer $id
 * @property string $username
 * @property string $password_hash
 * @property string $password_reset_token
 * @property string $email
 * @property string $auth_key
 * @property integer $status
 * @property integer $created_at
 * @property integer $updated_at
 * @property string $password write-only password
 */
class User extends BaseUser
{
    
    public $office_title;
    public $staff_title;
    public $employment_id;
    public $user_type;
    public $password;
 
    /** @inheritdoc */
    public function rules()
    {
        return [
            
            [['employment_id'], 'integer'],
            [['office_title', 'staff_title', 'password', 'user_type'], 'string'],
            [['office_title', 'staff_title', 'user_type','employment_id'], 'safe'],
            

            // username rules
            'usernameTrim'     => ['username', 'trim'],
            'usernameRequired' => ['username', 'required', 'on' => ['register', 'create', 'connect', 'update']],
            'usernameMatch'    => ['username', 'match', 'pattern' => static::$usernameRegexp],
            'usernameLength'   => ['username', 'string', 'min' => 3, 'max' => 255],
            'usernameUnique'   => [
                'username',
                'unique',
                'message' => \Yii::t('app', 'This username has already been taken')
            ],

            // email rules
            'emailTrim'     => ['email', 'trim'],
            'emailRequired' => ['email', 'required', 'on' => ['register', 'connect', 'create', 'update']],
            'emailPattern'  => ['email', 'email'],
            'emailLength'   => ['email', 'string', 'max' => 255],
            'emailUnique'   => [
                'email',
                'unique',
                'message' => \Yii::t('app', 'This email address has already been taken')
            ],

            // password rules
            'passwordRequired' => ['password', 'required', 'on' => ['register']],
            'passwordLength'   => ['password', 'string', 'min' => 6, 'max' => 72, 'on' => ['register', 'create']],
        ];
    }


    public function afterSave($insert, $changedAttributes)
    {
        parent::afterSave($insert, $changedAttributes);

        if ($insert) {
            $this->getDb()
                ->createCommand()
                ->insert('{{%auth_assignment}}', [
                    'item_name' => 'regular',
                    'user_id' => $this->id,
                    'created_at' => time(),
                ])
                ->execute();

            $this->saveApplicant();
        }
    }

    private function saveApplicant(){
        $applicant = new Applicant;
        $applicant->office_id = 1;
        $applicant->user_id = $this->id;
        $applicant->save();

    }
}
