<?php
/**
 * NoteForm Registration
 * @author  <your name here>
 */
class NoteForm extends TPage
{
    private $notebook;
    private $form; // form
    
    /**
     * Class constructor
     * Creates the page and the registration form
     */
    function __construct()
    {
        parent::__construct();
        
        // creates the form
        $this->form = new BootstrapFormBuilder('form_Note');
        $this->form->setFormTitle(('Comentários') );
        
        // create the form fields
        $id_biological_sample    = new THidden('id_biological_sample');
        $note        = new THtmlEditor('note');

        // define the sizes
        $note->setSize('100%', 200);

        $this->form->addFields( [$id_biological_sample] );
        $this->form->addFields( [$note] );
        $this->form->addAction( _t('Save'), new TAction(array($this, 'onSave')), 'fa:floppy-o');
        $btn = $this->form->addAction(('Voltar ao Mapa'), new TAction(['WelcomeView', 'onReload']), 'fa:map-o');
        $btn->class = 'btn btn-sm btn-success';
        
        // creates the page structure using a vbox
        $container = new TVBox;
        $container->style = 'width: 100%';
        $container->add(new TXMLBreadCrumb('menu.xml', 'WelcomeView'));
        $container->add($this->form);
        
        // add the vbox inside the page
        parent::add($container);
    }

    /**
     * method onSave()
     * Executed whenever the user clicks at the save button
     */
    function onSave()
    {
        try
        {
            TTransaction::open('permission');
            $logged = SystemUser::newFromLogin(TSession::getValue('login'));
            //$prefs  = SystemPreference::getAllPreferences();
            TTransaction::close();
            
            // open a transaction with database 'changeman'
            TTransaction::open('permission');
            
            // get the form data into an active record Note
            $object = $this->form->getData('Note');
            $object-> id_user = $logged-> id;
            $object-> register_date = date('Y-m-d');
            $object-> register_time = date('H:i');
             
            // form validation
            $this->form->validate();
            
            // stores the object
            $object->store();
            
            $issue = new BiologicalSample($object-> id_biological_sample);
            //$project = new Project($issue-> id_project);
            
            //$members = $project->getMembersAndManagers();
            // close the transaction
            TTransaction::close();
            
            TTransaction::open('permission');
            $issuer = new SystemUser($issue-> collection_user_id); // who has opened the issue
            TTransaction::close();
            
            // shows the success message
            new TMessage('info', TAdiantiCoreTranslator::translate('Record saved'));
            
            
            
            // fill the form with the active record data
            $this->form->setData($object);
        }
        catch (Exception $e) // in case of exception
        {
            // shows the exception error message
            new TMessage('error', $e->getMessage());
        }
    }
    
    /**
     * method onEdit()
     * Executed whenever the user clicks at the edit button da datagrid
     */
    function onEdit($param)
    {
        try
        {
            if (isset($param['key']))
            {
                // get the parameter $key
                $key=$param['key'];
                
                // instantiates object Note
                $object = new StdClass;
                $object-> id_biological_sample = (int) $key;
                
                // fill the form with the active record data
                $this->form->setData($object);
            }
            else
            {
                $this->form->clear();
            }
        }
        catch (Exception $e) // in case of exception
        {
            // shows the exception error message
            new TMessage('error', $e->getMessage());
        }
    }
}


