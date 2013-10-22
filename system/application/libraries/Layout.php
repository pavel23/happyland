<?php if (!defined('BASEPATH')) exit ('No direct script access allowed');
/**
 * Layout class for ci-layout library.
 *
 * @author Roumen Damianoff <roumen@dawebs.com>
 * @version 1.4
 * @link http://roumen.it/projects/ci-layout
 * @license http://opensource.org/licenses/mit-license.php MIT License
 */

class Layout {

    public $name = 'default';

    public $title = 'Admin Home Page -  Happyland';
    public $description = 'Admin Home Page';
    public $keywords = 'my, keywords';
    public $robots = 'all';
    public $canonical = 'http://mysite.tld';

    public $css = array();

    public $js_header = array();
    public $js_footer = array();

    public $scr_header = array();
    public $scr_footer = array();
    public $scr_ready = array();


    /**
     * Add new assets
     *
     * @param string $a
     * @param string $position
     *
     * @return void
     */
    function assets($a, $position = 'footer')
    {
        if (preg_match("/\.css/i", $a))
        {
            // css
            $this->css[] = $a;
        }

        elseif (preg_match("/\.js/i", $a))
        {
            // js
            if ($position == 'header')
                $this->js_header[] = $a;
            else
                $this->js_footer[] = $a;
        }
    }


    /**
     * Add new scripts
     *
     * @param string $s
     * @param string $position
     *
     * @return void
     */
    function scripts($s, $position = 'footer')
    {
        if ($position == 'footer')
            $this->scr_footer[] = $s;
        elseif ($position == 'header')
            $this->scr_header[] = $s;
        else
            $this->scr_ready[] = $s;
    }


    /**
     * Loads all items from $css array
     */
    function css()
    {
        if (!empty($this->css))
        {
            foreach($this->css as $file)
            {
                echo '<link rel="stylesheet" type="text/css" href="' . $file . '" />' . "\n";
            }
        }
    }


    /**
     * Loads all items from $js_header or $js_footer arrays
     *
     * @param string $p (options: 'footer', 'header')
     */
    function js($p = 'footer')
    {
        if ($p == 'header')
        {
            if (!empty($this->js_header))
            {
                foreach($this->js_header as $file)
                {
                    echo '<script type="text/javascript" src="' . $file . '"></script>' . "\n";
                }
            }
        } else {
            if (!empty($this->js_footer))
            {
                foreach($this->js_footer as $file)
                {
                    echo '<script type="text/javascript" src="' . $file . '"></script>' . "\n";
                }
            }
        }
    }


    /**
     * Loads all items from $scr_header, $scr_footer or $scr_ready arrays
     *
     * @param string $p (options: 'footer', 'header' or 'ready')
     */
    function scr($p = 'footer')
    {
        if ($p == 'footer')
        {
            if (!empty($this->script_footer))
            {
                foreach($this->script_footer as $script)
                {
                    echo '<script type="text/javascript">' . $script . "</script>\n";
                }
            }
        } elseif ($p == 'header')
        {
            if (!empty($this->scr_header))
            {
                foreach($this->scr_header as $script)
                {
                    echo '<script type="text/javascript">' . $script . "</script>\n";
                }
            }
        } else {
            if (!empty($this->scr_ready))
            {
                $p = '<script type="text/javascript">$(document).ready(function(){';
                foreach($this->scr_ready as $script)
                {
                    $p .= $script;
                }
                $p .= "});</script>\n";
                echo $p;
            }
        }
    }


    /**
     * Load view in the layout
     *
     * @param string $view
     * @param array  $view_data
     *
     * @return view
     */
    function view($view = 'site/index', $view_data = null)
    {
        $CI =& get_instance();

        $data['content'] = $CI->load->view($view, $view_data, TRUE);

        $CI->load->view('layout/'.$this->name, $data);
    }

}