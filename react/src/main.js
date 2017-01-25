/*jshint esversion: 6 */

import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';
import PodcastList from './components/PodcastList';

  $(function() {
    if (document.getElementById('review-list')) {
      ReactDOM.render(
        <App />,
        document.getElementById('review-list')
      );
    }
    if (document.getElementById('podcast-list')) {
      ReactDOM.render(
        <PodcastList />,
        document.getElementById('podcast-list')
      );
    }
  });
