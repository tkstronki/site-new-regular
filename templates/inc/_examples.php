<?php namespace ProcessWire;
?>

<div class='examples'>

  <h1>H1 Hello World</h1>
  <h2>H2 Hello World</h2>
  <h3>H3 Hello World</h3>
  <h4>H4 Hello World</h4>
  <h5>H5 Hello World</h5>
  <h6>H6 Hello World</h6>

  <hr>

<section>
  <h3>Section Heading</h3>
  <blockquote>Blockquote Hello World</blockquote>
  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi consequuntur temporibus beatae eum tempora labore inventore provident necessitatibus, quam ipsa?</p>
  <ul>
    <li>Hello</li>
    <li>is</li>
    <li>world</li>
  </ul>
  <a href="#">Link</a><br>
  <a class='btn' href="#">Link</a><br>
  <a class='btn -small' href="#"><?= icon('carrot') ?></a>
</section>


  <hr>

  <button class="btn">Btn</button>
  <button class="btn -primary">Btn primary</button>
  <button class="btn -secondary">Btn secondary</button>
  <button class="btn -accent">Btn accent</button>
  <button class="btn -warning">Btn warning</button>
  <button class="btn -success">Btn success</button>
  <button class="btn -error">Btn error</button>
  <button class="btn -icon">Btn icon <?= icon('carrot') ?> </button>
  <button class="btn -icon -primary outline">Btn icon <?= icon('carrot') ?> </button>
  <button class="btn -disabled" disabled>Button disabled</button>

  <hr>

  <p class='alert -error'>Alert Error</p>
  <p class='alert -success'>Alert Success</p>
  <p class='alert -primary'>Alert Primary</p>
  <p class='alert -secondary'>Alert Secondary</p>
  <p class='alert -accent'>Alert Accent</p>

  <hr>

  <table>
  <caption>
  Front-end web developer course 2021
  </caption>
  <thead>
  <tr>
    <th>Person</th>
    <th>Most interest in</th>
    <th>Age</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <th>Chris</th>
    <td>HTML tables</td>
    <td>22</td>
  </tr>
  <tr>
    <th>Dennis</th>
    <td>Web accessibility</td>
    <td>45</td>
  </tr>
  <tr>
    <th>Sarah</th>
    <td>JavaScript frameworks</td>
    <td>29</td>
  </tr>
  <tr>
    <th>Karen</th>
    <td>Web performance</td>
    <td>36</td>
  </tr>
  </tbody>
  <tfoot>
  <tr>
    <th>Average age</th>
    <td>33</td>
  </tr>
  </tfoot>
  </table>

  <hr>

  <?= component('_tabs',[
    'tabs' =>
    [
        '1 Tab' => '<p>Hello World - 1</p>',
        '2 Tab' => '<p>Hello World - 2</p>',
        'Contact info' => pages()->get("template=contact")->body
    ],'activeTab' => 3])
  ?>

  <?= component('_tabs',[
    'tabs' =>
    [
        '1 Tab' => '<p>Hello World - 1</p>',
        '2 Tab' => '<p>Hello World - 2</p>',
        'Contact info' => pages()->get("template=contact")->body
    ],'activeTab' => 1])
  ?>

  <hr>

  <?= component('_accordion',[
    'accordions' =>
    [
        '1 Accordion' => '<p>Hello World - 1</p>',
        '2 Accordion' => '<p>Hello World - 2</p>',
        'Contact info' => pages()->get("template=contact")->body
    ],'activeAccordion' => 2])
  ?>

  <hr>


  <?php

      // /** @var HelperOembed $embera */
      // $embera = modules()->get('HelperOembed');

      // echo $embera->embed('<h1>The BEST WAY to Combine Arrays in PHP</h1>
      // https://youtube.com/shorts/RabnpQnelNQ?si=DWdFKiBi-rAAebME
      // <h1>ProcessWire Love Story @ PHP Meetup Vienna 2023</h1>
      // https://youtu.be/ncS36UqaBvc?si=I-aFjEZrM6sf_G4X');

      // // with custom filters ( load via htmx )
      // echo $embera->embed('https://youtube.com/shorts/RabnpQnelNQ?si=DWdFKiBi-rAAebME
      // https://youtu.be/ncS36UqaBvc?si=I-aFjEZrM6sf_G4X
      // ',['filters' => true]);
  ?>

  <?php
      // // Uncomment components && refresh the page to generate Components, in the components folder as `components/_myFirstComponent`, `components/myfolder/_mayLastComponent.php` , ( this will auto generate component if $config->debug == true )
      // echo component('_myFirstComponent');
      // echo component('myfolder/_mayLastComponent');

      // // Uncomment partials && refresh the page to generate Partials, in the partials folder as `partials/_myFirstPartial`, `partials/myfolder/_mayLastPartial.php` , ( this will auto generate component if $config->debug == true )
      // echo partial('_myFirstPartial');
      // echo partial('myfolder/_mayLastPartial');

      /** @var Htmx $htmx */
      $htmx = new Htmx;

      echo $htmx->getOneModal(1022,'body','Click me to get field body from Contact Page') . '<br>';

      echo $htmx->getComponent("_helloWorld",
        "Load the Hello World Component in the  /components/_helloWorld.php.
        If it's the first HTMX request && not created before the component ( _helloWorld ),
        you must click the button twice to generate the component.
        To auto-generate the component, config()->debug must be set to true.",
      ) . '<br>';

      echo $htmx->getComponentModal("_helloWorld",
          "Load the Modal Hello World Modal Component from the file components/_helloWorld.php.<br>",
      ) . '<br>';


      echo $htmx->getPartial("_helloWorld","Load the Hello World Partial from the file partials/_helloWorld.php.<br>",
      [
        'class' => 'btn -primary',
        'hx-swap' => 'afterend',
        'hx-trigger' => 'click once'
      ]) . '<br>';

      echo $htmx->getPartialModal("_helloWorld",
          "Load the Modal Hello World Modal Partial from the file partials/_helloWorld.php.<br>",
          ['class' => 'btn -primary']) . '<br>';

      // Alpine
      echo Alpine::lightbox('Open Alpine Lightbox', "<p>Hello World</p><p><img src='https://picsum.photos/640/420'></p><a href='https://picsum.photos/640/420'>Read more</a>") . '<br>';
  ?>

</div>

<?php

$css = <<<CSS
  .examples {
    display: grid;
    grid-gap: var(--sp-xl);

  }
CSS;

region('exampless', Html::styleTag($css));
