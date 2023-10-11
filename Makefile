run:
	ruby lib/game.rb

test:
	bundle exec rspec

lint:
	bundle exec standardrb -a lib spec