class ReadPocket < ActiveJob::Base
  POCKET_URL = 'https://getpocket.com/a/read/'.freeze

  def initialize(user, url)
    @user = user
    @url  = url
  end

  def run
    read!
  end

  def read!
    return if url.blank?

    pocket = send("find_by_#{user.redirect_to}", url)
    return if pocket.blank?

    pocket.update(read_at: Time.current)

    ArchivePocketJob.perform_now(pocket) if user.setting.archive?
  end

  private

    attr_accessor :user, :url

    def find_by_pocket_url(url)
      user.pockets.find_by("raw -> 'item_id' ? :url", url: url.sub(POCKET_URL, ''.freeze))
    end

    def find_by_given_url(url)
      user.pockets.find_by("raw -> 'given_url' ? :url", url: url)
    end
end
