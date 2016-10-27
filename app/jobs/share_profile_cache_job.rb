class ShareProfileCacheJob

  @queue = :share_profile_cache

  def self.perform(share_profile_id)
    puts 'Running Share Profile Cacher'
    puts share_profile_id
    # ShareProfile.find(share_profile_id).cache_contact_methods()
    return
  end

end
