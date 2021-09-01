const APIUtil = {
    followUser: id => {
        return $.ajax({
            url: `/users/${id}/follow`,
            method: 'post',
            
            success: function() {
                
            },
            error: function () {

            },

            dataType: 'JSON',
        })
    },
  
    unfollowUser: id => {
        return $.ajax({
            url: `/users/${id}/follow`,
            method: 'delete',
            
            success: function() {

            },
            error: function () {

            },

            dataType: 'JSON',
        })
    
    }
  };
  
  module.exports = APIUtil;