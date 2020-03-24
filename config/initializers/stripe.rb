# frozen_string_literal: true

Rails.configuration.stripe={
    publishable_key: 'pk_test_jszjVLxWcixtNAVbGYF0gTKT00NpOJx0k4',
    secret_key: 'sk_test_kp7LL2clhKu4qiUxYrYiR3yP00Oe8gHRi0'
}
Stripe.api_key= Rails.configuration.stripe[:secret_key]