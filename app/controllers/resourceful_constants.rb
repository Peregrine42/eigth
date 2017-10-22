module ResourcefulConstants
  def create_success_message resource=nil
    [:success, "Success! Resource created."]
  end

  def create_failure_message resource=nil
    [:error, "Could not create a new Resource."]
  end

  def update_success_message resource=nil
    [:success, "Success! Resource updated."]
  end

  def update_failure_message resource=nil
    [:error, "Could not update the Resource."]
  end

  def delete_success_message resource=nil
    [:success, "Success! Resource deleted."]
  end

  def delete_failure_message resource=nil
    [:error, "Could not delete the Resource."]
  end
end

