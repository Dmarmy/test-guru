class GistQuestionService

  class GistResult
    def initialize(response)
      @response = response
    end

    def html_url
      @response['html_url']
    end

    def success?
      html_url.present?
    end
  end

  def initialize(question)
    @question = question
    @test = @question.test
    @client = octokit
  end

  def call
    response = @client.create_gist(gist_params)

    GistResult.new(response)
  end
  
  private

  def gist_params
    {
        description: I18n.t('gist_description', test: @test.title),
        files: {
            'test-guru-question.txt' => {
                content: gist_content
            }
        }
    }
  end

  def gist_content
    content = [@question.text]
    content += @question.answers.pluck(:text)
    content.join("\n")
  end

  def octokit
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

end