select username, created_at from users order by created_at limit 5;

select dayname(created_at) as 'date', count(created_at) as 'count' from users group by dayname(created_at) order by count desc;

select username from users left join photos on users.id = photos.user_id where photos.id is null;

select username, photos.id, photos.image_url, count(*) as total from photos inner join likes on likes.photo_id = photos.id inner join users on photos.user_id = users.id group by photos.id order by total desc limit 1;.

select tag_name, count(tag_id) as count from tags left join photo_tags on tags.id = tag_id group by tag_name order by count desc limit 5;

select username, count(*) as count from users inner join likes on users.id = likes.user_id group by likes.user_id having count = (select count(*) from photos);