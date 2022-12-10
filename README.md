# hip-hop-journey-backend

PLAN

- Finish login tests
  - Rather than spending a ton of time figuring out how to get cookie li 
    should just wait for authenticate to work and check that — that will
    verify login works
- Write authenticate test
- Route to get current user
  - GET /users/me
- Create authenticate middleware
- Add current_album (skip ahead to seeding album table)
  - Test to get logged in user's current album
- Albums routes
  - Update table in google sheets
  - Export to CSV
  - Convert to SQL
  - Add to setup SQL (verify beekeeper) then return to current_album
- Get all albums
- Get album by id
- Function to get user's current album
- Create users_albums to join for favorite albums
  - When a user favorites album, insert into users_albums
  - Get favorited albums functions using SQL joins to make a table where    
    user_id = user.id and album_id = album.id
