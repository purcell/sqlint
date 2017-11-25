test:
	bundle exec rspec

gem:
	# Ensure perms are correct
	chmod +x bin/sqlint
	chmod -R a+r *
	chmod -R a+X *
	gem build sqlint.gemspec

.PHONY: gem test
