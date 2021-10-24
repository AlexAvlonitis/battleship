
![battleship](battleship.png)

Quick and dirty console battleship game in ruby. 2 players take turns to sink each others ships. [battleship (wikipedia)](https://en.wikipedia.org/wiki/Battleship_(game))

```ruby
# run the server
ruby bin/run_server.rb

# run 2 times, on separate terminals
ruby bin/run_client.rb
```

## Improvements
- [x] Create main server, with clients run on separate consoles using ruby distributed object system.
- [ ] Handle client disconnects on the server
- [ ] tidy up some of the code and console text layout
