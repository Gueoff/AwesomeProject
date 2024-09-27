import { by, element, expect } from 'detox'

describe('Startup', () => {
  it('should have the login form displayed', async () => {
    await expect(element(by.id('SignInScreen'))).toBeVisible()
  })
})
