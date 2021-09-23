import React from 'react';
import PostIndexItem from './post_index_item';
import CreatePostFormContainer from './create_post_form_container';

/*
Export a `PostIndex` presentational component that renders a list (`ul`) of
`PostIndexItems`. This component should receive `posts` from the store as a prop
via its container and fetch them once it has successfully mounted to the DOM.
Below the `ul`, render the `CreatePostFormContainer` component.
*/

export default class PostIndex extends React.Component{
   componentDidMount(){
      this.props.fetchPosts();
   }

   render(){
      const {posts} = this.props;

      return(
         <div>
            <ul>
               {
                  posts.map( post => (
                        <PostIndexItem post={post} deletePost={this.props.deletePost} key={post.id}/>
                     )
                  )
               }
            </ul>

            <CreatePostFormContainer/>
         </div>
      )
   }
}