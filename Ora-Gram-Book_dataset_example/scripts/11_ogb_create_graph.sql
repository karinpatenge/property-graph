/******************************************
 * Create graph for ORA-GRAM-BOOK dataset
 * Author: Karin Patenge
 * Last updated: May 2024
 ******************************************/

CREATE PROPERTY GRAPH oragram_book_graph
   VERTEX TABLES (
      ogb_users
         KEY ( id )
         LABEL users
         PROPERTIES ( id, dob, email, first, last, sign_up_date ),
      ogb_posts
         KEY ( id )
         LABEL posts
         PROPERTIES ( id, content, posted_date ),
      ogb_comments
         KEY ( id )
         LABEL comments
         PROPERTIES ( id, comment_text )
   )
   EDGE TABLES (
      ogb_views
         KEY ( id )
         SOURCE KEY ( viewer_id ) REFERENCES ogb_users ( id )
         DESTINATION KEY ( post_id ) REFERENCES ogb_posts ( id )
         LABEL views
         PROPERTIES ( id, view_date ),
      ogb_user_made_comment
         KEY ( id )
         SOURCE KEY ( user_id ) REFERENCES ogb_users ( id )
         DESTINATION KEY ( comment_id ) REFERENCES ogb_comments ( id )
         LABEL owns
         PROPERTIES ( id, comment_date ),
      ogb_creates
         KEY ( id )
         SOURCE KEY ( poster_id ) REFERENCES ogb_users ( id )
         DESTINATION KEY ( post_id ) REFERENCES ogb_posts ( id )
         LABEL creates
         PROPERTIES ( id ),
      ogb_follows
         KEY ( id )
         SOURCE KEY ( follower_id ) REFERENCES ogb_users ( id )
         DESTINATION KEY ( followed_id ) REFERENCES ogb_users ( id )
         LABEL follows
         PROPERTIES ( id ),
      ogb_commented_on
         KEY ( id )
         SOURCE KEY ( comment_id ) REFERENCES ogb_comments ( id )
         DESTINATION KEY ( post_id ) REFERENCES ogb_posts ( id )
         LABEL commented_on
         PROPERTIES ( id ),
      ogb_replies
         KEY ( id )
         SOURCE KEY ( comment_id ) REFERENCES ogb_comments ( id )
         DESTINATION KEY ( reply_to ) REFERENCES ogb_comments ( id )
         LABEL replied_to
         PROPERTIES ( id, reply_date ),
      ogb_likes
         KEY ( id )
         SOURCE KEY ( liker_id ) REFERENCES ogb_users ( id )
         DESTINATION KEY ( post_id ) REFERENCES ogb_posts ( id )
         LABEL liked
         PROPERTIES ( id, like_date )
   );