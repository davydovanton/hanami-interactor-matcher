# Hanami::Interactor::Matcher

**This repository is no longer maintain**

Simple dry-matcher class for working with hanami interactor results


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hanami-interactor-matcher'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hanami-interactor-matcher

## Usage
For exampe you have simple interactor class:

```ruby
class Operation
  include Hanami::Interactor
  expose :value

  def call(condition: true)
    if condition
      @value = 'hello'
    else
      @value = 'error'
      fail!
    end
  end
end
```

### Matcher mixin
You can use special mixin `Hanami::Interactor::Matcher::Mixin` which provide `#matcher` method.
It will be useful in actions:

```ruby
module Action
  class Index
    include Hanami::Interactor::Matcher::Mixin

    def initialize(operation: Operation.new)
      @operation = operation
    end

    def call(params)
      result = @operation.call(params)

      match(result) do |m|
        m.success { |v| "Yay: #{v}" }
        m.failure { |v| "Boo: #{v}" }
      end
    end
  end
end

action = Action::Index.new
action.call(condition: true) # => 'Yay: hello'
action.call(condition: false) # => 'Boo: error'
```

### Call injection
We use simple monkey patching for updating `#call` method:

```ruby
Operation.new.call(condition: true) do |m|
  m.success { |v| puts "Yay: #{v}" }
  m.failure { |v| puts "Boo: #{v}" }
end
# => 'Yay: hello'

Operation.new.call(condition: false) do |m|
  m.success { |v| puts "Yay: #{v}" }
  m.failure { |v| puts "Boo: #{v}" }
end
# => 'Boo: error'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/davydovanton/hanami-interactor-matcher. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Hanami::Interactor::Matcher project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/davydovanton/hanami-interactor-matcher/blob/master/CODE_OF_CONDUCT.md).
