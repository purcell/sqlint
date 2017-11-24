test:
	bundle exec rspec

gem:
	# Ensure perms are correct
	find . -type d -not -path "./.git/*" -exec chmod a+rx '{}' ';'
	find . -type f -not -path "./.git/*" -exec chmod a+r '{}' ';'
	chmod a+x bin/sqlint
	gem build sqlint.gemspec

.PHONY: gem test
