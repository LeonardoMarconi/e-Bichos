<?php
class SystemModulesCheckView extends TPage
{
    function __construct()
    {
        parent::__construct();
        
        $html1 = new THtmlRenderer('app/resources/system_welcome_en.html');
        
        // replace the main section variables
        $html1->enableSection('main', array());
        
        
        $panel1 = new TPanelGroup();
        $panel1->add($html1);
        
        
        $vbox = TVBox::pack($html1);
        $vbox->style = 'display:block; width: 100%';
        
        // add the template to the page
        parent::add( $vbox );
    }
}
