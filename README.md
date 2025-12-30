# ⚖️ Challenge 4: Build a DEX (Decentralized Exchange) - Speedrun Ethereum

**Bài tập môn Blockchain:** Xây dựng sàn giao dịch phi tập trung (DEX) cho phép hoán đổi giữa ETH và Token ERC20 theo cơ chế AMM.\*\*

**Sinh viên:** 22120165 - Lê Anh Khôi

## 🛠 Tech Stack

- **Framework:** Scaffold-ETH 2
- **Blockchain:** Optimism Sepolia (Testnet)
- **Language:** Solidity (Smart Contract) & TypeScript (Frontend)
- **Core Concepts:** ERC20 Standard, Automated Market Maker (AMM), Constant Product Formula (x \* y = k), Liquidity Provider (LP).

## 🌟 Cơ chế hoạt động (Game Mechanics)

Dự án mô phỏng một sàn DEX đơn giản với đồng token `Balloons ($BAL)` và `ETH`:

1. **Price Mechanism (Cơ chế định giá):**

- Sử dụng công thức hằng số tích số: `x * y = k` (trong đó x và y là lượng dự trữ ETH và Token trong pool).
- Giá token được tính toán tự động dựa trên tỉ lệ dự trữ hiện tại, không phụ thuộc vào Oracle bên ngoài.

2. **Liquidity (Thanh khoản):**

- **Init:** Khởi tạo pool với 0.01 ETH và lượng lớn Balloons Token (đã fix lỗi thiếu gas khi deploy).
- **Deposit:** Người dùng nạp cả ETH và Token vào pool để cung cấp thanh khoản, nhận lại phí giao dịch (theo mô hình LP).
- **Withdraw:** Rút thanh khoản về dựa trên tỉ lệ sở hữu trong pool.

3. **Swapping (Hoán đổi):**

- `ethToToken`: Người dùng gửi ETH, nhận về Balloons.
- `tokenToEth`: Người dùng gửi Balloons, nhận về ETH.
- Giao dịch chịu tác động của trượt giá (slippage) nếu khối lượng giao dịch lớn so với thanh khoản pool.

4. **Side Quest: Event Tracking (Đã hoàn thành):**

- Hiện thực hóa việc phát sự kiện (Emit Event) cho hàm `approve`.
- Frontend hiển thị lịch sử cấp quyền (Approval History) minh bạch cho người dùng.

## 🚀 Hướng dẫn chạy chương trình (How to run)

### 1. Cài đặt (Installation)

Yêu cầu: Node.js (>= 20.17.0) và Yarn.

```bash
git clone https://github.com/theConnectorr/bc-4-dex
cd bc-4-dex
yarn install

```

### 2. Cấu hình môi trường (Environment)

Tạo file `.env` (nếu cần) hoặc dùng cấu hình mặc định của Scaffold-ETH 2.

### 3. Deploy Smart Contract

Triển khai contract `Balloons` và `DEX` lên mạng Optimism Sepolia.
_Lưu ý: Đã chỉnh sửa script deploy để khởi tạo thanh khoản 0.01 ETH để tránh lỗi Insufficient Funds._

```bash
# 1. Tạo ví deployer & Nạp ETH (nếu chưa có)
yarn generate
yarn account

# 2. Deploy
yarn deploy --network optimismSepolia

```

### 4. Kiểm thử (Testing)

Chạy các test case để đảm bảo công thức tính giá và logic swap hoạt động đúng.

```bash
yarn test

```

### 5. Chạy Frontend

```bash
yarn start

```

Truy cập `http://localhost:3000`.

### 6. Verify Contract

```bash
yarn verify --network optimismSepolia

```

## 📸 Minh chứng hoàn thành (Evidence)

### 1. Live Demo

- **Website URL:** https://challenge-dex-beta.vercel.app
- **Balloons Contract:** https://sepolia-optimism.etherscan.io/address/0x7ECB0E0BFa0FD08973a4fC811b2f96Ad749Ed02c

### 2. Các chức năng chính (Screenshots)

- **Swap Interface:** Giao diện người dùng thực hiện hoán đổi ETH sang Balloons.
- **Liquidity:** Hiển thị tổng thanh khoản trong Pool thay đổi khi người dùng Deposit/Withdraw.
- **Side Quest - Events Page:** (Ảnh chụp màn hình tab `/events`):
- Hiển thị bảng log realtime các giao dịch `approve`.
- Các cột dữ liệu: Owner Address, Spender (DEX Address), Value (Amount Approved).
