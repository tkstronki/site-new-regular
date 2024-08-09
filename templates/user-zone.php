<?php namespace ProcessWire;

// Template file for pages using the “basic-page” template

/** @var FlashMessage $flashMessage */
$flashMessage = new FlashMessage;

/** @var Site $site */
$site = new Site;

if($input->get('login') && user()->isSuperuser()) {
    $session->logout();
    $flashMessage->error(t('notPremissions'), page()->url);
}

// translations
$tNew = t('createNew');
$tUpdate = t('update');
$tDelete = t('delete');
?>

<!-- custom titile -->
<head id="html-head" pw-append>
    <title><?= page()->title ?></title>
</head>

<body id="body">

    <header>
        <div>
            <a class='btn' href="<?= $site->url ?>">
                <?= t('backTo') ?>
                <?= Html::img($site?->logo,['width' => 40, 'height' => 40, 'class' => 'logo', 'lozad' => false]) ?>
                <span class='siteName'><?= $site->name ?></span>
            </a>
            <?= $flashMessage->render(); ?>
        </div>
    </header>

        <div id='todos' class='todos'>
        <?php
        // get user profile
        if($input->get('profile') || $input->get('logout') || $input->get('register') || $input->get('forgot')) {
            echo Html::a(page()->url, t('backTo') . ' ' . page()->title, ['class' => 'btn -primary']);
        }

        $loginRegister = $modules->get('LoginRegister');

        try {
            echo $loginRegister->execute() . '<br>';
        } catch (\Exception $e){
            $flashMessage->error($e->getMessage());
        }

        if(user()->isLoggedin() && $user->hasRole('login-register') && !$input->get('profile') && !$input->get('logout')) {

            $todoID = $input->get('todoID');
            $userId = user()->id;
            $title = input()->get('title');

            if(input()->get('deleteTodo') && $todoID) {
                $todo = pages()->findOne("template=user-todo,id=$todoID,include=all");
                $todo->delete();
                $flashMessage->success(t('deleteTodo') . " $title");
            }

            if(input()->get('updateTodo') && $title) {
                $todo = pages()->findOne("template=user-todo,id=$todoID,include=all");
                $todo->setAndSave('title', $title);
                $flashMessage->success("Update todo $title");
            }

            if(input()->get('createTodo') && $title) {
                try {
                    $p = $pages->new([
                        'template' => 'user-todo',
                        'parent' => $userId,
                        'title' => $title
                    ]);
                }  catch (WireException $e) {
                    // An error occurred while creating the page
                    $message = $e->getMessage();
                    $log->error($message);
                    // eror for user
                    $flashMessage->error(t('errorCreating') . " - $p->title");
                }

                $flashMessage->success($tNew . " - $p->title");
            }


            echo <<<HTML
                <h3 class='title'>$tNew</h3>
                <form
                    action=''
                    hx-get="{$page->url}"
                    hx-target="#body"
                >
                    <input type="text" name="title" id="" required>
                    <input type="hidden" name="createTodo" value='createTodo'>
                    <button type='submit'

                    >Submit</button>
                </form>
            HTML;

            echo Html::h3('Todos', ['class' => 'title']);

            foreach ($user->children("include=all") as $todo) {
                echo <<<HTML
                    <form
                        action=''
                        hx-get="{$page->url}"
                        hx-target="#body"
                    >
                        <input type='text' name='title' value='{$todo->title}'>
                        <input type='hidden' name='todoID' value='{$todo->id}'>
                        <input class='btn' type='submit' name='updateTodo' value='{$tUpdate}'>
                        <input class='btn' type='submit' name='deleteTodo' value='{$tDelete}'>
                    </form>
                HTML;
            }
        }
        ?>

        </div>

        <style>
            header {
                justify-items: left;
            }
            #body {
                max-width: var(--mw-lg);
                .title {
                    margin-top: var(--sp-xl);
                }

                .todos {
                    max-width: var(--mw-xs);
                }

                .LoginRegisterMessage {
                    color: var(--color-accent);
                    border: var(--sp-4xs) dotted var(--color-primary);
                    border-radius: var(--br);
                }

                .LoginRegisterError {
                    color: var(--color-error);
                }

                .Inputfield:not(.InputfieldSubmit) {
                    background: var(--color-bg);
                    border: var(--sp-5xs) dotted var(--color-accent);
                    border-radius: var(--br);
                    margin-bottom: var(--sp-lg);
                }
            }
        </style>

    <div class='bottom-region'>
        <!-- Color Mode -->
        <?= (new ColorMode)->render() ?>
    </div>
</body>

