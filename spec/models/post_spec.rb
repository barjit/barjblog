require 'rails_helper'

RSpec.describe Post, type: :model do
  subject {
    described_class.new(title: "Title of post", body: "Body of post")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "raises an error if saved without a title" do
    subject.title = nil
    expect { subject.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end

  it "is not valid without a body" do
    subject.body = nil
    expect(subject).to_not be_valid
  end

  it "raises an error if saved without a body" do
    subject.body = nil
    expect { subject.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
  end

  it "changes the number of Posts" do
    post = Post.new(title: "Post Title", body:"Another body of text")
    expect { post.save }.to change { Post.count }.by(1)
  end

end
