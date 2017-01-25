/*jshint esversion: 6 */

import React, { Component } from 'react';
import Podcast from './Podcast';

class PodcastList extends Component {
  constructor() {
    super();
    this.state = {
      podcasts: []
    };

    this.componentDidMount = this.componentDidMount.bind(this);
    this.getPodcasts = this.getPodcasts.bind(this);
  }

  getPodcasts() {
   fetch('/api/v1/podcasts.json')
   .then(response => {
    if (response.ok) {
      return response;
    } else {
      let errorMessage = `${response.status}, (${response.statusText})`;
      let error = new Error(errorMessage);
      throw(error);
    }
  })
  .then(response => response.json())
  .then(body => {
    let podcasts = body;
    this.setState({ podcasts: podcasts });
  })
  .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount() {
    this.getPodcasts();
    let wait = setInterval(this.getPodcasts, 10000);
  }

  render() {
    let podcasts = [];
    this.state.podcasts.forEach(function(podcast) {
      podcasts.push(
        <Podcast
        key={podcast.id}
        podcast={podcast}
        />
      );
    }.bind(this));
    return (
      <div>
        <ul className="podcast-index">{podcasts}</ul>
      </div>
    );
  }
}

export default PodcastList;
