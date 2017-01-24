import React, { Component } from 'react';
import Upvote from './Upvote';
import Downvote from './Downvote';
import EditForm from './EditForm';

class Review extends Component {
  constructor(props) {
    super(props);
    this.state = {
      user: "",
      total_votes: 0,
      editing: false,
      rating: this.props.review.rating,
      body: this.props.review.body
    };
    this.componentWillMount = this.componentWillMount.bind(this);
    this.handleUpvote = this.handleUpvote.bind(this);
    this.handleDownvote = this.handleDownvote.bind(this);
    this.handleEdit = this.handleEdit.bind(this);
    this.handleRatingChange = this.handleRatingChange.bind(this);
    this.handleBodyChange = this.handleBodyChange.bind(this);
  }

  componentWillMount() {
    fetch(`/api/v1/reviews/${this.props.review.id}/users.json`)
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
      let user = body;
      this.setState({ user: user });
    })
    .then(response => {
      fetch(`/api/v1/reviews/${this.props.review.id}/total_votes.json`)
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
        let total_votes = body;
        this.setState({ total_votes: total_votes });
      })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  handleUpvote() {
    let voteData = {
      'vote': {
        'value': 1
      }
    };
    let jsonStringData = JSON.stringify(voteData);
    fetch(`/api/v1/reviews/${this.props.review.id}/votes.json`, {
      method: 'post',
      body: jsonStringData
    })
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
      let total_votes = body;
      this.setState({ total_votes: total_votes })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  handleDownvote() {
    let voteData = {
      'vote': {
        'value': -1
      }
    };
    let jsonStringData = JSON.stringify(voteData);
    fetch(`/api/v1/reviews/${this.props.review.id}/votes.json`, {
      method: 'post',
      body: jsonStringData
    })
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
      let total_votes = body;
      this.setState({ total_votes: total_votes })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  handleEdit(review_id) {
    this.setState({
      editing: true
    });
  }

  handleRatingChange(event) {
    let newRating = event.target.value;
    this.setState({ rating: newRating });
  }

  handleBodyChange(event) {
    let newBody = event.target.value;
    this.setState({ body: newBody });
  }

  render() {
    let form;
      if (this.state.editing) {
        form =
        <EditForm
        currentRating={this.state.rating}
        currentBody={this.state.body}
        handleRatingChange={this.handleRatingChange}
        handleBodyChange={this.handleBodyChange}
        />;
      }
    return (
      <div className="review-list-item">
        <p>Rating: {this.props.review.rating}</p>
        <p>{this.state.user.name}</p>
        <p>{this.props.review.body}</p>
        <p>{this.state.total_votes}</p>
        <Upvote
        handleUpvote={this.handleUpvote}
        />
        <Downvote
        handleDownvote={this.handleDownvote}
        />
        <p onClick={() => this.handleEdit()}>Edit</p>
        <p onClick={this.props.handleDelete}>Delete</p>
        {form}
      </div>

    );
  }
}

export default Review;
