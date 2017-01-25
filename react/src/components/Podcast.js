/*jshint esversion: 6 */

import React, { Component } from 'react';

class Podcast extends Component {
  constructor(props) {
    super(props);
    this.state = {
      provider: ""
    };
    this.componentWillMount = this.componentWillMount.bind(this);
    this.componentWillUpdate = this.componentWillUpdate.bind(this);
    this.getProvider = this.getProvider.bind(this);
  }

  getProvider() {
    fetch(`/api/v1/podcasts/${this.props.podcast.id}/providers.json`)
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
      let provider = body;
      this.setState({ provider: provider });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentWillMount() {
    this.getProvider();
  }

  componentWillUpdate() {
    this.getProvider();
  }

  render() {
    return (
      <a href={"/podcasts/" + this.props.podcast.id}>
        <li className="podcast-list-item">
          <span className="podcast-name">
            {this.props.podcast.name}<br />
          </span>
          <span className="provider-name">
            {this.state.provider.name}
          </span>
        </li>
      </a>
    );
  }
}

export default Podcast;
