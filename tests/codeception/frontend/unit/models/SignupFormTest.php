<?php

namespace tests\codeception\frontend\unit\models;

use Codeception\Specify;
use frontend\models\SignupForm;
use tests\codeception\common\fixtures\UserFixture;
use tests\codeception\frontend\unit\DbTestCase;

class SignupFormTest extends DbTestCase
{

    use Specify;

    public function testCorrectSignup()
    {
        $model = new SignupForm([
            'username' => 'some_username',
            'email' => 'some_email@example.com',
            'password' => 'some_password',
        ]);

        $user = $model->signup();

        $this->assertInstanceOf('User', $user, 'user should be valid');

        expect('username should be correct', $user->username)->equals('some_username');
        expect('email should be correct', $user->email)->equals('some_email@example.com');
        expect('password should be correct', $user->validatePassword('some_password'))->true();
    }

    public function testNotCorrectSignup()
    {
        $model = new SignupForm([
            'username' => 'troy.becker',
            'email' => 'nicolas.dianna@hotmail.com',
            'password' => 'some_password',
        ]);

        expect('username and email are in use, user should not be created', $model->signup())->null();
    }

    public function fixtures()
    {
        return [
            'user' => [
                'class' => UserFixture::className(),
                'dataFile' => '@tests/codeception/frontend/unit/fixtures/data/models/user.php',
            ],
        ];
    }
}
