require "test_helper"

describe WorkController do
  it "should get title:string" do
    get work_title:string_url
    value(response).must_be :success?
  end

  it "should get creator:string" do
    get work_creator:string_url
    value(response).must_be :success?
  end

  it "should get year_published:int" do
    get work_year_published:int_url
    value(response).must_be :success?
  end

  it "should get description:string" do
    get work_description:string_url
    value(response).must_be :success?
  end

end
