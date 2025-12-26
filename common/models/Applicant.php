<?php

namespace common\models;

use Yii;
use yii\base\Exception;
use yii\helpers\FileHelper;
use common\service\CacheService;
use common\models\base\Applicant as BaseApplicant;
use yii\web\UploadedFile;

/**
 * This is the model class for table "tx_applicant".
 */
class Applicant extends BaseApplicant
{
    public $image;
    public $url;
    public static $path='/uploads/applicant';

    const GENDER_STATUS_MALE            = 1;
    const GENDER_STATUS_FEMALE          = 2;

    const BLOOD_TYPE_A                  = 1;
    const BLOOD_TYPE_B                  = 2;
    const BLOOD_TYPE_AB                 = 3;
    const BLOOD_TYPE_O                  = 4;
    const BLOOD_TYPE_NA                 = 5;

    const CHILD_STATUS_BIOLOGICAL       = 1;
    const CHILD_STATUS_STEP             = 2;
    const CHILD_STATUS_ADOPTED          = 3;

    const FINAL_STATUS_NO               = 1;
    const FINAL_STATUS_YES              = 2;

    const APPROVAL_STATUS_UNCONFIRM     = 1;
    const APPROVAL_STATUS_APPROVE       = 2;
    const APPROVAL_STATUS_REJECT        = 3;

    const CITIZENSHIP_STATUS_WNI        = 1;
    const CITIZENSHIP_STATUS_WNA        = 2;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return array_replace_recursive(parent::rules(),
	    [
            [['office_id', 'event_id', 'user_id', 'gender_status', 'religion_id', 'citizenship_status', 'blood_type', 'height', 'weight', 'head_circle', 'number_of_sibling', 'number_of_dependent', 'number_of_step_sibling', 'birth_order', 'child_status', 'final_status', 'approval_status', 'date_approval', 'approved_by', 'created_by', 'updated_by', 'deleted_by', 'verlock'], 'integer'],
            [['date_birth', 'date_final', 'created_at', 'updated_at', 'deleted_at'], 'safe'],
            [['hobby', 'illness', 'disability', 'description'], 'string'],
            [['email', 'title', 'nick_name', 'native_language', 'file_name'], 'string', 'max' => 100],
            [['record_number'], 'string', 'max' => 15],
            [['family_card_number', 'identity_number', 'birth_certificate_number', 'birth_place', 'address_street', 'address_village', 'address_sub_district', 'address_city', 'address_province', 'phone_number'], 'string', 'max' => 50],
            [['uuid'], 'string', 'max' => 36],
            [['verlock'], 'default', 'value' => '0'],
            [['verlock'], 'mootensai\components\OptimisticLockValidator']
        ]);
    }
    public function beforeSave($insert) {

        if ($this->isNewRecord) {
            $this->final_status = self::FINAL_STATUS_NO;
            $this->approval_status = self::APPROVAL_STATUS_UNCONFIRM;
        }

        if(empty($this->record_number)) {
            $this->record_number = Counter::getSerialNumber('MBA');
        }

        if(empty($this->event_id)){
            $event = Event::find()->where(['is_active'=> Event::IS_ACTIVE_ENABLED])->one();
            $this->event_id = $event->id;
        }

        if(empty($this->email)) {
            $this->email = $this->user->email;
        }

        //ATUR HURUF BESAR DI AWAL KATA-KATA
        $this->title                    = ucwords($this->title);
        $this->nick_name                = ucwords($this->nick_name);
        $this->birth_place              = ucwords($this->birth_place);
        $this->address_street           = ucwords($this->address_street);
        $this->address_village          = ucwords($this->address_village);
        $this->address_sub_district     = ucwords($this->address_sub_district);
        $this->address_city             = ucwords($this->address_city);
        $this->address_province         = ucwords($this->address_province);
        $this->hobby                    = ucwords($this->hobby);
        $this->native_language          = ucwords($this->native_language);
        $this->illness                  = ucwords($this->illness);
        $this->disability               = ucwords($this->disability);

        return parent::beforeSave($insert);
    }

    /**
     * This function helps \mootensai\relation\RelationTrait runs faster
     * @return array relation names of this model
     */
    public function relationNames()
    {
        return [
            'user', //new

            'event',
            'office',
            'religion',
            'applicantAlmamaters',
            'applicantDocuments',
            'applicantFamilies',
            'applicantGrades',
            'applicantStandings'
        ];
    }

    public function getUser()
    {
        return $this->hasOne(User::class, ['id' => 'user_id']);
    }


    public static function getArrayGenderStatus(): array
    {
        return [
            //MASTER
            self::GENDER_STATUS_MALE       => 'Laki-laki',
            self::GENDER_STATUS_FEMALE     => 'Perempuan',
        ];
    }

    public static function getOneGenderStatus($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayGenderStatus();
            $returnValue = 'NULL';

            switch ($_module) {
                case ($_module == self::GENDER_STATUS_MALE):
                    $returnValue = '<span class="label label-primary">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::GENDER_STATUS_FEMALE):
                    $returnValue = '<span class="label label-info">'.$arrayModule[$_module].'</span>';
                    break;
                default:
                    $returnValue = '<span class="label label-default">'.$arrayModule[$_module].'</span>';
            }

            return $returnValue;

        }
        else
            return;
    }

    public static function getArrayBloodType()
    {
        return [
            self::BLOOD_TYPE_A      => 'A',
            self::BLOOD_TYPE_B      => 'B',
            self::BLOOD_TYPE_AB     => 'AB',
            self::BLOOD_TYPE_O      => 'O',
            self::BLOOD_TYPE_NA      => 'Belum tahu',
        ];
    }

    public static function getOneBloodType($_module = null){
        if($_module){
            $arrayModule = self::getArrayBloodType();
            $returnValue = 'NULL';

            switch ($_module) {
                case ($_module == self::BLOOD_TYPE_A):
                    $returnValue = '<span class="label label-primary">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::BLOOD_TYPE_B):
                    $returnValue = '<span class="label label-success">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::BLOOD_TYPE_AB):
                    $returnValue = '<span class="label label-warning">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::BLOOD_TYPE_O):
                    $returnValue = '<span class="label label-danger">'.$arrayModule[$_module].'</span>';
                    break;
                default:
                    $returnValue = '<span class="label label-default">'.$arrayModule[$_module].'</span>';
            }
            return $returnValue;
        }
        else
            return;
    }

    public static function getArrayChildStatus(): array
    {
        return [
            self::CHILD_STATUS_BIOLOGICAL   => 'Anak Kandung',
            self::CHILD_STATUS_STEP         => 'Anak Tiri',
            self::CHILD_STATUS_ADOPTED      => 'Anak Angkat',
        ];
    }

    public static function getOneChildStatus($_module = null){
        if($_module){
            $arrayModule = self::getArrayChildStatus();
            $returnValue = 'NULL';

            switch ($_module) {
                case ($_module == self::CHILD_STATUS_BIOLOGICAL):
                    $returnValue = '<span class="label label-primary">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::CHILD_STATUS_STEP):
                    $returnValue = '<span class="label label-info">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::CHILD_STATUS_ADOPTED):
                    $returnValue = '<span class="label label-success">'.$arrayModule[$_module].'</span>';
                    break;
                default:
                    $returnValue = '<span class="label label-default">'.$arrayModule[$_module].'</span>';
            }
            return $returnValue;
        }
        else
            return;
    }

    public static function getArrayFinalStatus()
    {
        return [
            //MASTER
            self::FINAL_STATUS_NO       => 'Belum',
            self::FINAL_STATUS_YES      => 'Sudah',
        ];
    }

    public static function getOneFinalStatus($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayFinalStatus();
            $returnValue = 'NULL';

            switch ($_module) {
                case ($_module == self::FINAL_STATUS_NO): //1
                    $returnValue = '<span class="label label-danger">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::FINAL_STATUS_YES): //2
                    $returnValue = '<span class="label label-success">'.$arrayModule[$_module].'</span>';
                    break;
                default:
                    $returnValue = '<span class="label label-default">NA</span>';
            }

            return $returnValue;

        }
        else
            return;
    }

    public static function getArrayApprovalStatus(): array
    {
        return [
            //MASTER
            self::APPROVAL_STATUS_UNCONFIRM     => 'Antrian',
            self::APPROVAL_STATUS_REJECT        => 'Ditolak',
            self::APPROVAL_STATUS_APPROVE       => 'Disetujui',
        ];
    }

    public static function getOneApprovalStatus($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayApprovalStatus();
            $returnValue = 'NULL';

            switch ($_module) {
                case ($_module == self::APPROVAL_STATUS_UNCONFIRM)://1
                    $returnValue = '<span class="label label-warning">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::APPROVAL_STATUS_APPROVE)://2
                    $returnValue = '<span class="label label-success">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::APPROVAL_STATUS_REJECT): //3
                    $returnValue = '<span class="label label-danger">'.$arrayModule[$_module].'</span>';
                    break;
                default:
                    $returnValue = '<span class="label label-default">NA</span>';
            }

            return $returnValue;
        }
        else
            return;
    }

    public static function getArrayCitizenshipStatus()
    {
        return [
            //MASTER
            self::CITIZENSHIP_STATUS_WNI    => 'Indonesia',
            self::CITIZENSHIP_STATUS_WNA    => 'Asing',
        ];
    }

    public static function getOneCitizenshipStatus($_module = null)
    {
        if($_module)
        {
            $arrayModule = self::getArrayCitizenshipStatus();
            $returnValue = 'NULL';

            switch ($_module) {
                case ($_module == self::CITIZENSHIP_STATUS_WNI):
                    $returnValue = '<span class="label label-primary">'.$arrayModule[$_module].'</span>';
                    break;
                case ($_module == self::CITIZENSHIP_STATUS_WNA):
                    $returnValue = '<span class="label label-warning">'.$arrayModule[$_module].'</span>';
                    break;
                default:
                    $returnValue = '<span class="label label-default">'.$arrayModule[$_module].'</span>';
            }

            return $returnValue;

        }
    }

    /**
     * fetch a stored image file name with a complete path
     * @param bool $isTemporary
     * @return string
     * @throws Exception
     */
    public function getAssetFile(bool $isTemporary=false): string
    {
        $directory = str_replace('frontend', 'backend', Yii::getAlias('@webroot')) . $this->getPath();
        if ($isTemporary) :
            $directory = str_replace('frontend', 'backend', Yii::getAlias('@webroot')) . $this->getTmpPath();
        endif;

        if (!is_dir($directory)) {
            FileHelper::createDirectory($directory, $mode = 0777);
        }
        return (!empty($this->file_name)) ? $directory.'/'. $this->file_name : '';
    }


    public function getAssetUrl(): string
    {
        // return a default image placeholder if your source avatar is not found
        $defaultImage = '/images/if_skype2512x512_197582.png';
        $asset_name = (!empty($this->file_name)) ? $this->file_name : $defaultImage;
        $directory = str_replace('frontend', 'backend', Yii::getAlias('@webroot')) . $this->getPath();

        if (file_exists($directory.'/'.$asset_name)) {
            $file_parts = pathinfo($directory.'/'.$asset_name);
            if($file_parts['extension']=='pdf'){
                Yii::$app->urlManager->baseUrl . $this->getPath().'/'.$asset_name;
            }

            var_dump(Yii::$app->urlManager->baseUrl . $this->getPath().'/'.$asset_name);
            return Yii::$app->urlManager->baseUrl . $this->getPath().'/'.$asset_name;
        }
        else{
            return Yii::$app->urlManager->baseUrl . $defaultImage;
        }
    }

    /**
     * Process deletion of image
     *
     * @return boolean the status of deletion
     */
    public function deleteAsset($isTemporary=false): bool
    {
        $file = $this->getAssetFile($isTemporary);

        // check if file exists on server
        if (empty($file) || !file_exists($file)) {
            return false;
        }

        // check if uploaded file can be deleted on server
        if (!unlink($file)) {
            return false;
        }

        if(!$isTemporary):
            // if deletion successful, reset your file attributes
            $this->file_name = null;
            $this->title = null;
        endif;

        return true;
    }

    public function getUrl()
    {
        return Yii::$app->getUrlManager()->createUrl(['staff/view', 'id' => $this->id, 'title' => $this->title]);
    }

    public static function getName($id){
        $model = Staff::find()->where(['id'=>$id])->one();
        return $model->title;
    }

    public function getPath() : string {
        $officeUniqueId = CacheService::getInstance()->getOfficeUniqueIdByApplicant();
        return '/uploads/applicant/'.$officeUniqueId;
    }

    public function getTmpPath(): string{
        return '/uploads/tmp';
    }


    public function addChildData(){
        $transaction = \Yii::$app->db->beginTransaction();
        try {
            $applicantAlmamaterElementary = new ApplicantAlmamater();
            $applicantAlmamaterElementary->applicant_id = $this->id;
            $applicantAlmamaterElementary->educational_stage_id = $applicantAlmamaterElementary->getElementarySchool();
            $applicantAlmamaterElementary->save();

            $applicantAlmamaterJunior = new ApplicantAlmamater();
            $applicantAlmamaterJunior->applicant_id = $this->id;
            $applicantAlmamaterJunior->educational_stage_id = $applicantAlmamaterJunior->getJuniorHighSchool();
            $applicantAlmamaterJunior->save();

            $applicantFamilyFather                  = new ApplicantFamily();
            $applicantFamilyFather->applicant_id    = $this->id;
            $applicantFamilyFather->family_type     = ApplicantFamily::FAMILY_TYPE_FATHER;
            $applicantFamilyFather->save();

            $applicantFamilyMother                  = new ApplicantFamily();
            $applicantFamilyMother->applicant_id    = $this->id;
            $applicantFamilyMother->family_type     = ApplicantFamily::FAMILY_TYPE_MOTHER;
            $applicantFamilyMother->save();

            $applicantFamilyGuardian                = new ApplicantFamily();
            $applicantFamilyGuardian->applicant_id  = $this->id;
            $applicantFamilyGuardian->family_type   = ApplicantFamily::FAMILY_TYPE_GUARDIAN;
            $applicantFamilyGuardian->save();

            $semesters  = Semester::find()->orderBy(['sequence'=>SORT_ASC])->all();
            $courses    = Course::find()->orderBy(['sequence'=>SORT_ASC])->all();

            foreach ($semesters as $semesterModel) {
                foreach ($courses as $courseModel) {
                    $applicantGrade                   = new ApplicantGrade();
                    $applicantGrade->applicant_id     = $this->id;
                    $applicantGrade->course_id        = $courseModel->id;
                    $applicantGrade->title            = $courseModel->title;
                    $applicantGrade->semester_id      = $semesterModel->id;
                    $applicantGrade->grade            = 0;
                    $applicantGrade->save();
                }
            }

//            $documents = Document::find()->orderBy(['sequence'=>SORT_ASC])->all();
//            foreach ($documents as $documentModel) {
//                $applicantDocument                  = new ApplicantDocument();
//                $applicantDocument->applicant_id    = $this->id;
//                $applicantDocument->document_id     = $documentModel->id;
//                $applicantDocument->document_status = Document::APPROVAL_STATUS_UNCONFIRM;
//                $applicantDocument->save();
//            }

            $transaction->commit();
        }
        catch (\Exception $e) {
            $transaction->rollBack();
            throw $e;
        }
        catch (\Throwable $e) {
            $transaction->rollBack();
            throw $e;
        }
    }

    public function sumAverage() {
        $value = 0;
        if(!empty($this->applicantGrades)){
            $query      = ApplicantGrade::find()->where(['applicant_id'=>$this->id]);
            $totalGrade = $query->asArray()->sum('grade');
            $totalData  = $query->asArray()->count();
            $value      = ($totalGrade/$totalData);
        }
        return Yii::$app->formatter->asDecimal(round($value,2,PHP_ROUND_HALF_UP));
    }

    public function getDateFinal(){


        $dateFinal = strtotime('01'.'-'.'01'.'-'.'1900'.' 00:00:01');

//        if(!empty($this->applicantStandings)){
//            $applicantStanding  = ApplicantStanding::find()->where(['applicant_id'=>$this->id])->one();
//            $dateFinal = $applicantStanding->date_final;
//        }

        return $dateFinal;
    }


    /**
     * fetch stored image file name with complete path
     * @return string
     */
    public function getImageFile()
    {
        $directory = str_replace('frontend', 'backend', Yii::getAlias('@webroot')) . self::$path;
        if (!is_dir($directory)) {
            FileHelper::createDirectory($directory, $mode = 0777);
        }
        return (!empty($this->file_name)) ? $directory.'/'. $this->file_name : '';
    }

    /**
     * fetch stored image url
     * @return string
     */
    public function getImageUrl()
    {
        // return a default image placeholder if your source avatar is not found
        $file_name = isset($this->file_name) ? self::$path.'/'.$this->file_name : '/themes/home8/img/team/img32-md.jpg';
        return str_replace('uploads', 'backend/web/uploads', Yii::$app->urlManager->baseUrl . $file_name);
    }

    /**
     * Process upload of image
     *
     * @return mixed the uploaded image instance
     */
    public function uploadImage() {
        // get the uploaded file instance. for multiple file uploads
        // the following data will return an array (you may need to use
        // getInstances method)
        $image = UploadedFile::getInstance($this, 'image');

        // if no image was uploaded abort the upload
        if (empty($image)) {
            return false;
        }

        // generate a unique file name
        //$ext = end((explode(".", $image->name)));
        $tmp = explode('.', $image->name);
        $ext = end($tmp);

        //$this->file_name = Yii::$app->security->generateRandomString().".{$ext}";
        $this->file_name = $this->record_number.".{$ext}";

        // the uploaded image instance
        return $image;
    }

    /**
     * Process deletion of image
     *
     * @return boolean the status of deletion
     */
    public function deleteImage() {
        $file = $this->getImageFile();

        // check if file exists on server
        if (empty($file) || !file_exists($file)) {
            return false;
        }

        // check if uploaded file can be deleted on server
        if (!unlink($file)) {
            return false;
        }

        // if deletion successful, reset your file attributes
        $this->file_name = null;
        $this->title = null;

        return true;
    }
}
