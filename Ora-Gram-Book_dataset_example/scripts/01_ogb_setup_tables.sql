/******************************************
 * Set up tables for ORAGRAM-BOOK dataset
 * Author: Karin Patenge
 * Last updated: May 2024
 ******************************************/

create table ogb_comments (
   id number,
	comment_text varchar2(4000),
	constraint ogb_comments_pk primary key (id) using index enable ) ;

create table ogb_posts (
   id number,
	content varchar2(4000),
	posted_date timestamp (6),
	constraint ogb_posts_pk primary key (id) using index  enable ) ;

create table ogb_users (
   id number,
	first varchar2(4000),
	last varchar2(4000),
	email varchar2(4000),
	dob date,
	sign_up_date timestamp (6),
	constraint ogb_user_pk primary key (id) using index  enable ) ;

create table ogb_views (
   id number,
	viewer_id number,
	post_id number,
	view_date timestamp (6),
	constraint ogb_views_pk primary key (id) using index  enable ) ;

alter table ogb_views
add constraint ogb_viewer_fk foreign key (viewer_id)
references ogb_users (id) enable;

alter table ogb_views
add constraint ogb_viewed_post_fk foreign key (post_id)
references ogb_posts (id) enable;

create table ogb_replies (
   id number,
	comment_id number,
	reply_to number,
	reply_date timestamp (6),
	constraint ogb_replies_pk primary key (id) using index  enable ) ;

alter table ogb_replies
add constraint ogb_reply_made_fk foreign key (comment_id)
references ogb_comments (id) enable;

alter table ogb_replies
add constraint ogb_reply_to_fk foreign key (reply_to)
references ogb_comments (id) enable;

create table ogb_user_made_comment (
   id number,
	user_id number,
	comment_id number,
	comment_date timestamp (6),
	constraint ogb_made_comment_pk primary key (id) using index  enable ) ;

alter table ogb_user_made_comment
add constraint ogb_commenter_fk foreign key (user_id)
references ogb_users (id) enable;

alter table ogb_user_made_comment
add constraint ogb_commented_post_fk foreign key (comment_id)
references ogb_comments (id) enable;

create table ogb_commented_on (
   id number,
	comment_id number,
	post_id number,
	constraint ogb_commented_on_pk primary key (id) using index  enable ) ;

alter table ogb_commented_on
add constraint ogb_comment_id_fk foreign key (comment_id)
references ogb_comments (id) enable;

alter table ogb_commented_on
add constraint ogb_commented_on_post_fk foreign key (post_id)
references ogb_posts (id) enable;

create table ogb_creates (
   id number,
	poster_id number,
	post_id number,
	constraint ogb_creates_pk primary key (id) using index  enable ) ;

alter table ogb_creates
add constraint ogb_creator_fk foreign key (poster_id)
references ogb_users (id) enable;

alter table ogb_creates
add constraint ogb_created_post_fk foreign key (post_id)
references ogb_posts (id) enable;

create table ogb_follows (
   id number,
	follower_id number,
	followed_id number,
	followed_date timestamp (6),
	constraint ogb_follows_pk primary key (id) using index  enable ) ;

alter table ogb_follows
add constraint ogb_follower_fk foreign key (follower_id)
references ogb_users (id) enable;

alter table ogb_follows
add constraint ogb_followed_post_fk foreign key (followed_id)
references ogb_users (id) enable;

create table ogb_likes (
   id number,
	liker_id number,
	post_id number,
	like_date timestamp (6),
	constraint ogb_likes_pk primary key (id) using index  enable ) ;

alter table ogb_likes
add constraint ogb_liking_user_fk foreign key (liker_id)
references ogb_users (id) enable;

alter table ogb_likes
add constraint ogb_liked_post_fk foreign key (post_id)
references ogb_posts (id) enable;