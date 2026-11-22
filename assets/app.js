import './stimulus_bootstrap.js';
/*
 * Welcome to your app's main JavaScript file!
 *
 * This file will be included onto the page via the importmap() Twig function,
 * which should already be in your base.html.twig.
 */

// CSS de bootstrap 5.3 (téléchargé dans assets/vendor/ par importmap:require)
// importé en prmeier : ainsi, mon css perso surchargera les règles BS

import 'bootstrap/dist/css/bootstrap.min.css'
import './styles/app.css';

console.log('This log comes from assets/app.js - welcome to AssetMapper! 🎉');
