class BadgeService

  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passage = test_passage
  end

  def call
    Badge.all.find_each do |badge|
      add_badge(badge) if send("add_for_#{badge.title}?", badge.rule)
    end
  end

  private

  def add_for_test_first_try?(_params)
    @user.tests.where(id: @test.id).count == 1 if @test_passage.passed_successfully?
  end

  def add_for_all_tests_category?(title)
    category_tests_ids = Category.find_by(title: title).tests.ids

    (category_tests_ids - successful_tests_uniq_ids).empty?
  end

  def add_for_all_tests_level?(level)
    tests_by_level_ids = Test.where(level: level).ids

    (tests_by_level_ids - successful_tests_uniq_ids).empty?
  end

  def successful_tests_uniq_ids
    successful_tests.map(&:test_id).uniq
  end


  def add_badge(badge)
    @user.badges << badge
  end
end