<?php

/*
 * This file is part of Fork CMS.
 *
 * For the full copyright and license information, please view the license
 * file that was distributed with this source code.
 */

use Symfony\Component\HttpFoundation\Response;

/**
 * Frontend page class, this class will handle everything on a page
 *
 * @author Tijs Verkoyen <tijs@sumocoders.be>
 * @author Matthias Mullie <forkcms@mullie.eu>
 * @author Dave Lens <dave.lens@wijs.be>
 */
class FrontendPage extends FrontendBaseObject
{
	/**
	 * Breadcrumb instance
	 *
	 * @var FrontendBreadcrumb
	 */
	protected $breadcrumb;

	/**
	 * Array of extras linked to this page
	 *
	 * @var array
	 */
	protected $extras = array();

	/**
	 * Footer instance
	 *
	 * @var	FrontendFooter
	 */
	protected $footer;

	/**
	 * Header instance
	 *
	 * @var	FrontendHeader
	 */
	protected $header;

	/**
	 * The current pageId
	 *
	 * @var	int
	 */
	protected $pageId;

	/**
	 * Content of the page
	 *
	 * @var	array
	 */
	protected $record = array();

	/**
	 * The path of the template to show
	 *
	 * @var	string
	 */
	protected $templatePath;

	/**
	 * The statuscode
	 *
	 * @var	int
	 */
	protected $statusCode = 200;

	public function __construct()
	{
		parent::__construct();
		Spoon::set('page', $this);
	}

	/**
	 * Loads the actual components on the page
	 */
	public function load()
	{
		// set tracking cookie
		FrontendModel::getVisitorId();

		// get pageId for requested URL
		$this->pageId = FrontendNavigation::getPageId(implode('/', $this->URL->getPages()));

		// set headers if this is a 404 page
		if($this->pageId == 404) $this->statusCode = 404;

		// create breadcrumb instance
		$this->breadcrumb = new FrontendBreadcrumb();

		// create header instance
		$this->header = new FrontendHeader();

		// new footer instance
		$this->footer = new FrontendFooter();

		// get page content
		$this->getPageContent();

		// process page
		$this->processPage();

		// execute all extras linked to the page
		$this->processExtras();

		// store statistics
		$this->storeStatistics();

		// trigger event
		FrontendModel::triggerEvent(
			'core',
			'after_page_processed',
			array(
				'id' => $this->getId(),
				'record' => $this->getRecord(),
				'statusCode' => $this->getStatusCode(),
				'sessionId' => SpoonSession::getSessionId(),
				'visitorId' => FrontendModel::getVisitorId(),
				'SESSION' => $_SESSION,
				'COOKIE' => $_COOKIE,
				'GET' => $_GET,
				'POST' => $_POST,
				'SERVER' => $_SERVER
			)
		);
	}

	/**
	 * Display the page
	 */
	public function display()
	{
		// parse header
		$this->header->parse();

		// parse breadcrumb
		$this->breadcrumb->parse();

		// parse languages
		$this->parseLanguages();

		// parse footer
		$this->footer->parse();

		// assign the id so we can use it as an option
		$this->tpl->assign('isPage' . $this->pageId, true);

        //add isMobile
        $this->tpl->assign("isMobile", $this->isBrowserMobile());


        // the the positions to the template
		$this->parsePositions();

		// assign empty positions
		$unusedPositions = array_diff($this->record['template_data']['names'], array_keys($this->record['positions']));
		foreach($unusedPositions as $position) $this->tpl->assign('position' . SpoonFilter::ucfirst($position), array());

		// output
		return new Response(
			$this->tpl->getContent($this->templatePath, false, true),
			$this->statusCode
		);
	}
    /**
     * Detect if the user agent is a mobile browser
     * @return bool
     */
    private function isBrowserMobile()
    {
        $useragent = $_SERVER['HTTP_USER_AGENT'];
        return $useragent && preg_match('/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i',$useragent)||preg_match('/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i',substr($useragent,0,4));
    }
	/**
	 * Get the extras linked to this page
	 *
	 * @return array
	 */
	public function getExtras()
	{
		return $this->extras;
	}

	/**
	 * Get the current page id
	 *
	 * @return int
	 */
	public function getId()
	{
		return $this->pageId;
	}

	/**
	 * Get page content
	 */
	protected function getPageContent()
	{
		// load revision
		if($this->URL->getParameter('page_revision', 'int') != 0)
		{
			// get data
			$this->record = FrontendModel::getPageRevision($this->URL->getParameter('page_revision', 'int'));

			// add no-index to meta-custom, so the draft won't get accidentally indexed
			$this->header->addMetaData(array('name' => 'robots', 'content' => 'noindex, nofollow'), true);
		}

		// get page record
		else $this->record = (array) FrontendModel::getPage($this->pageId);

		// empty record (pageId doesn't exists, hope this line is never used)
		if(empty($this->record) && $this->pageId != 404) SpoonHTTP::redirect(FrontendNavigation::getURL(404), 404);

		// init var
		$redirect = true;

		// loop blocks, if all are empty we should redirect to the first child
		foreach($this->record['positions'] as $blocks)
		{
			// loop blocks in position
			foreach($blocks as $block)
			{
				// HTML provided?
				if($block['html'] != '') $redirect = false;

				// an decent extra provided?
				if($block['extra_type'] == 'block') $redirect = false;

				// a widget provided
				if($block['extra_type'] == 'widget') $redirect = false;
			}
		}

		// should we redirect?
		if($redirect)
		{
			// get first child
			$firstChildId = FrontendNavigation::getFirstChildId($this->record['id']);

			// validate the child
			if($firstChildId !== false)
			{
				// build URL
				$URL = FrontendNavigation::getURL($firstChildId);

				// redirect
				SpoonHTTP::redirect($URL, 301);
			}
		}
	}

	/**
	 * Get the content of the page
	 *
	 * @return	array
	 */
	public function getRecord()
	{
		return $this->record;
	}

	/**
	 * Fetch the status code for the current page.
	 *
	 * @return int
	 */
	public function getStatusCode()
	{
		return $this->statusCode;
	}

	/**
	 * Parse the languages
	 */
	protected function parseLanguages()
	{
		// just execute if the site is multi-language
		if(SITE_MULTILANGUAGE)
		{
			// get languages
			$activeLanguages = FrontendLanguage::getActiveLanguages();

			// init var
			$languages = array();

			// loop active languages
			foreach($activeLanguages as $language)
			{
				// build temp array
				$temp = array();
				$temp['url'] = '/' . $language;
				$temp['label'] = $language;
				$temp['name'] = FL::msg(strtoupper($language));
				$temp['current'] = (bool) ($language == FRONTEND_LANGUAGE);

				// add
				$languages[] = $temp;
			}

			// assign
			if(count($languages) > 1) $this->tpl->assign('languages', $languages);
		}
	}

	/**
	 * Parse the positions to the template
	 */
	protected function parsePositions()
	{
		// init array to store parsed positions data
		$positions = array();

		do
		{
			$oldPositions = $positions;

			// fetch variables from main template
			$mainVariables = $this->tpl->getAssignedVariables();

			// loop all positions
			foreach($this->record['positions'] as $position => $blocks)
			{
				// loop all blocks in this position
				foreach($blocks as $i => $block)
				{
					// check for extras that need to be reparsed
					if(isset($block['extra']))
					{
						// fetch extra-specific variables
						if(isset($positions[$position][$i]['variables']))
						{
							$extraVariables = $positions[$position][$i]['variables'];
						}
						else
						{
							$extraVariables = $block['extra']->getTemplate()->getAssignedVariables();
						}

						// assign all main variables
						$block['extra']->getTemplate()->assignArray($mainVariables);

						// overwrite with all specific variables
						$block['extra']->getTemplate()->assignArray($extraVariables);

						// parse extra
						$positions[$position][$i] = array(
							'variables' => $block['extra']->getTemplate()->getAssignedVariables(),
							'blockIsHTML' => false,
							'blockContent' => $block['extra']->getContent()
						);
					}
					else $positions[$position][$i] = $block;
				}

				// assign position to template
				$this->tpl->assign('position' . SpoonFilter::ucfirst($position), $positions[$position]);
			}
		}
		while($oldPositions != $positions);
	}

	/**
	 * Processes the extras linked to the page
	 */
	protected function processExtras()
	{
		// loop all extras
		foreach($this->extras as $extra)
		{
			$this->getContainer()->get('logger')->info(
				"Executing frontend action '{$extra->getAction()}' for module '{$extra->getModule()}'."
			);

			// all extras extend FrontendBaseObject, which extends KernelLoader
			$extra->setKernel($this->getKernel());
			$extra->execute();

			// overwrite the template
			if(is_callable(array($extra, 'getOverwrite')) && $extra->getOverwrite()) $this->templatePath = $extra->getTemplatePath();

			// assign the variables from this extra to the main template
			$this->tpl->assignArray((array) $extra->getTemplate()->getAssignedVariables());
		}
	}

	/**
	 * Processes the page
	 */
	protected function processPage()
	{
		// set pageTitle
		$this->header->setPageTitle($this->record['meta_title'], (bool) ($this->record['meta_title_overwrite'] == 'Y'));

		// set meta-data
		$this->header->addMetaDescription($this->record['meta_description'], (bool) ($this->record['meta_description_overwrite'] == 'Y'));
		$this->header->addMetaKeywords($this->record['meta_keywords'], ($this->record['meta_keywords_overwrite'] == 'Y'));
		$this->header->setMetaCustom($this->record['meta_custom']);

		// advanced SEO-attributes
		if(isset($this->record['meta_data']['seo_index'])) $this->header->addMetaData(array('name' => 'robots', 'content' => $this->record['meta_data']['seo_index']));
		if(isset($this->record['meta_data']['seo_follow'])) $this->header->addMetaData(array('name' => 'robots', 'content' => $this->record['meta_data']['seo_follow']));

		// create navigation instance
		new FrontendNavigation();

		// assign content
		$this->tpl->assign('page', $this->record);

		// set template path
		$this->templatePath = FRONTEND_PATH . '/' . $this->record['template_path'];

		// loop blocks
		foreach($this->record['positions'] as $position => &$blocks)
		{
			// position not known in template = skip it
			if(!in_array($position, $this->record['template_data']['names'])) continue;

			// loop blocks in position
			foreach($blocks as $index => &$block)
			{
				// an extra
				if($block['extra_id'] !== null)
				{
					// block
					if($block['extra_type'] == 'block')
					{
						// create new instance
						$extra = new FrontendBlockExtra($block['extra_module'], $block['extra_action'], $block['extra_data']);
					}

					// widget
					else
					{
						// create new instance
						$extra = new FrontendBlockWidget($block['extra_module'], $block['extra_action'], $block['extra_data']);
					}

					// add to list of extras
					$block = array('extra' => $extra);

					// add to list of extras to parse
					$this->extras[] = $extra;
				}

				// the block only contains HTML
				else
				{
					$block = array(
						'blockIsHTML' => true,
						'blockContent' => $block['html']
					);
				}
			}
		}
	}

	/**
	 * Store the data for statistics
	 */
	protected function storeStatistics()
	{
		// @later save temp statistics data here.
	}
}
