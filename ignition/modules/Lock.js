const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("Token", (m) => {
  const token = m.contract("token");

  m.call(token, "balanceOf", []);

  return { token };
});
