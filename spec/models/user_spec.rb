require 'rails_helper'

describe User do
  describe 'find_by_omniauth' do
    subject { User.find_by_omniauth(auth) }
    let(:user) { FactoryGirl.create(:user) }
    let!(:authentication) { FactoryGirl.create(:authentication, user: user) }
    context 'User exists' do
      let(:auth) { { 'provider' =>authentication.provider, 'uid' => authentication.uid } }
      it { is_expected.to eq user }
    end

    context 'User not exists' do
      let(:auth) { { 'provider' => 'identity', 'uid' => '112233' } }
      it { is_expected.to eq nil }
    end
  end
end
