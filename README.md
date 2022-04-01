[![Coverage Status](https://coveralls.io/repos/github/afinetooth/coveralls-demo-ruby/badge.svg?branch=master)](https://coveralls.io/github/afinetooth/coveralls-demo-ruby?branch=master)

[Coveralls](https://coveralls.io/) demo project, using:

* [Ruby](https://www.ruby-lang.org/) — *Language*
* [Rspec](https://rspec.info/) — *Testing Library*
* [Simplecov](https://github.com/colszowka/simplecov) — *Code Coverage Library*

### How to run it:

```
bundle install
```

## About Coveralls

[Coveralls](http://coveralls.io) is a web service that sends code coverage reports to a shared workspace so you and your team can track your project's code coverage over time. [Coveralls](http://coveralls.io) can also post PR comments and pass / fail checks to help you control your development workflow. 

[Coveralls](http://coveralls.io) is language-, SCM- and CI-agnostic, but for this project we're using Ruby and GitHub, with various CI Services depending on the branch you choose.

## How It Works

Before your project gets to [Coveralls](http://coveralls.io), it must already be using a __code coverage library__ to generate coverage results. In this project, we're using the [Ruby](https://www.ruby-lang.org/)-based [Simplecov](https://github.com/colszowka/simplecov):

![How It Works - Basic Project Requirements](../media/media/project.png)

__Here's how it works:__

1. You commit changes to your repo at your SCM ([GitHub](http://github.com)).
2. Your CI service builds your project, runs your test, and generates your code coverage report.
3. Your CI posts those results to [Coveralls](http://coveralls.io).
4. [Coveralls](http://coveralls.io) updates your project with new coverage results.
5. (Optional) [Coveralls](http://coveralls.io) posts PR comments and pass/fail checks to control your development workflow.

<details>
  <summary><em>What then?</em></summary>

---

There's an implicit *__Step 6__* here, which is you deciding whether to merge, and deploy, the new changes based on coverage. This can be manual or automated, based on settings you configure at [Coveralls](http://coveralls.io). 

---

</details>

![How It Works - Simple case](../media/media/how-it-works-simple.png)

We'll set up this project to work exactly like the above diagram, with these four (4) steps:

## Get Started

1. Understand test coverage in this project
2. Run tests for the first time
3. Add tests and see coverage change
4. Configure this project to use [Coveralls](http://coveralls.io)

## 1. Understand test coverage in this project

<details>
  <summary>Do it.</summary>

---

This is the totality of the code in this project:

```ruby
class ClassOne

  def self.covered
    "covered"
  end

  def self.uncovered
    "uncovered"
  end

end
```

And these are the tests:

```ruby
require 'spec_helper'
require 'class_one'

describe ClassOne do

  describe "covered" do
    it "returns 'covered'" do
      expect(ClassOne.covered).to eql("covered")
    end
  end

  # Uncomment below to achieve 100% coverage
  # describe "uncovered" do
  #   it "returns 'uncovered'" do
  #     expect(ClassOne.uncovered).to eql("uncovered")
  #   end
  # end
end
```

Notice that right now, only one of the two methods in `ClassOne` is being tested.
</details>

## 2. Run tests for the first time

<details>
  <summary>Do it.</summary>

---

Let's run the test suite for the first time and see what the results are.

If you haven't already, go ahead and clone the project down to your local machine:

```
git clone git@github.com:afinetooth/coveralls-demo-ruby.git
```

Now, `cd` into `coveralls-demo-ruby` and run this command to install the dependencies:

```
bundle install
```

Finally, run the test suite, [Rspec](https://rspec.info/).

```
bundle exec rspec
```

You'll notice test results on the screen, which should look like this:

```ruby
ClassOne
  covered
    returns 'covered'

Finished in 0.0028 seconds (files took 1 second to load)
1 example, 0 failures

Coverage report generated for RSpec to /Users/jameskessler/Workspace/2020/coveralls/coveralls-demo-ruby/coverage. 4 / 5 LOC (80.0%) covered.
```

In additional to the test results themselves, we have the added benefit of test _coverage_ results, from using our test coverage library, [Simplecov](https://github.com/colszowka/simplecov). 

Every time we run our test suite, [Simplecov](https://github.com/colszowka/simplecov), in the background, generates HTML-based code coverage results, which you can see by opening the newly created file at `/coverage/index.html` in your browser, or by issuing this command in your terminal:

```
open coverage/index.html
```

The first results should look like this:

![80% Coverage - Index View](../media/media/coverage_80_percent_index.png)

Where coverage stands at 80% for the entire project.

Clicking on `lib/class_one.rb` brings up results for the file:

![80% Coverage - File View](../media/media/coverage_80_percent_file.png?raw=true)

Where you'll notice covered lines in green, and uncovered lines in red.

In our case, 4/5 lines are covered, indicating 80% coverage.

<details>
  <summary>Why isn't coverage 50%?</summary>
  
---

One might expect the coverage results here to be 50%, given that `ClassOne` has two (2) methods (`covered` and `uncovered`) and we're only testing one of them. However, that's not how it works. Instead, Simplecov counts *relevant lines* in each file and compares the number of covered lines to uncovered lines to determine the file's coverage percentage. 
</details>

</details>

## 3. Add tests and see coverage change

<details>
  <summary>Do it.</summary>

---

To "add" tests, simply un-comment the test of the second method in `ClassOne`:

```ruby
require 'spec_helper'
require 'class_one'

describe ClassOne do

  describe "covered" do
    it "returns 'covered'" do
      expect(ClassOne.covered).to eql("covered")
    end
  end

  # Uncomment below to achieve 100% coverage
  describe "uncovered" do
    it "returns 'uncovered'" do
      expect(ClassOne.uncovered).to eql("uncovered")
    end
  end
end
```

Now run the test suite again:

```
bundle exec rspec
```

And open the new results at `coverage/index.html`.

Here's how things look now:

![100% Coverage - Index View](../media/media/coverage_100_percent_index.png?raw=true)

Notice coverage has increased from 80% to 100% (and turned green).

And now, if we click on `lib/class_one.rb` we see:

![100% Coverage - File View](../media/media/coverage_100_percent_file.png?raw=true)

Five (5) out of five (5) relevant lines are now covered, resulting in 100% coverage for the file, which means 100% coverage for our one-file project.
</details>

## 4. Configure this project to use Coveralls

<details>
  <summary>Do it.</summary>

---

Now that you understand how test coverage works in this project, you'll soon be able to verify the same results through [Coveralls](http://coveralls.io).

### Which CI Service will you use? 

Since your CI Service will be sending code coverage results to [Coveralls](http://coveralls.io), you'll need to choose a CI service and add this repo to it.<sup>*</sup>

Follow the branch for your CI service and we'll pick up the conversation there:

1. [Travis CI](https://github.com/afinetooth/coveralls-demo-ruby/tree/travis)
2. [Circle CI](https://github.com/afinetooth/coveralls-demo-ruby/tree/circle)
3. ...

Insignificant change to README to trigger a new build.

<details>
  <summary></small>* other scenarios</small></summary>

---

<small>Technically speaking, there are other ways to send your test coverage results to <a href="http://coveralls.io">Coveralls</a> without a CI Service; namely, through their API. That's not the subject of this README, so to find out more see <a href="https://docs.coveralls.io/api-introduction">Coveralls API Docs</a>. You can find out about creating new repos <a href="https://coveralls.io/api/docs">here</a>, and about posting coverage results to those repos <a href="https://docs.coveralls.io/api-reference">here</a>.</small>
</details>

</details>
