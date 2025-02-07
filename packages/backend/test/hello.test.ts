import { printHello } from "@/printHello";

test('printHello', () => {
  printHello()

  expect(true).toBeTruthy();
});
