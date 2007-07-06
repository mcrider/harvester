<?php

/**
 * @file FormValidatorPost.inc.php
 *
 * Copyright (c) 2005-2007 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @package form.validation
 * @class FormValidatorPost
 *
 * Form validation check to make sure it's a POSTed form.
 *
 * $Id$
 */

import ('form.validation.FormValidator');

class FormValidatorPost extends FormValidator {
	/**
	 * Constructor.
	 * @see FormValidator::FormValidator()
	 * @param message string the locale key to use (optional)
	 */
	function FormValidatorPost(&$form, $message = 'form.postRequired') {
		parent::FormValidator($form, 'dummy', 'required', $message);
	}
	
	/**
	 * Check if field value is valid.
	 * Value is valid if it is empty and optional or matches regular expression.
	 * @return boolean
	 */
	function isValid() {
		return Request::isPost();
	}
	
}

?>