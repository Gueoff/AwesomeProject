import { by, device, element, expect } from 'detox'

describe('Startup', () => {
  beforeEach(async () => {
    await device.reloadReactNative()
  })

  it('should have the login form displayed', async () => {
    await expect(element(by.id('SignInScreen'))).toBeVisible()
  })

  it('Should display alert', async () => {
    await expect(element(by.id('SignInScreen'))).toBeVisible()
    await element(by.id('Button')).tap()
  })
})
