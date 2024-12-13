
## Given a 6 DoF serial link manipulator, which of the following pairs of quantities should we expect to be able to control independently?

- **Position and Orientation** (end-effector pose) – controlled independently in a 6 DoF manipulator.
- **Joint Angles** – these are constrained by the pose of the end-effector.
- **Velocities and Accelerations** – dependent on joint velocities and accelerations, not independent of the end-effector’s motion.
- **Forces and Torques** – constrained by the joint dynamics, not controlled independently from torques or the robot’s configuration.

## Grasp

- Form closure
	- 抓取器能夠通過其幾何結構完全約束物體，即無論物體受到什麼外力，它都無法移動。這通常意味著抓取點已經完全包圍物體，抓取器的位置和形狀對物體形成了剛性的機械約束
	- 只靠抓取器和物體之間的接觸點的幾何關係來約束物體，無需依賴外力
	- 通常需要較多的抓取點，適用於不要求施加很大力的場景
- Force closure
	- 抓取器通過施加適當的力（例如摩擦力或正交力）來穩定物體，抵消物體可能受到的外力。即便物體的運動在某些方向上沒有被完全幾何約束，只要抓取器施加的力足夠，物體仍然能保持穩定
	- 依賴於施加的力和摩擦來實現穩定性，常需要在接觸點產生摩擦力以抵抗外力的干擾
- Gap function
	- 描述的是物體和抓取器之間接觸點的距離或者相對位置
	- 表示抓取器與物體之間是否存在“間隙”或“自由度”
	- 在 Form closure 的情況下，所有 Gap function 的值都必須為零，這表示在所有的可能運動方向上，物體與抓取器之間沒有間隙，也就是說物體的每個自由度都被抓取器的接觸點完全約束
	- Gap function 是 Form closure 的必要條件，Form closure 實際上要求所有的 Gap function 都等於零，表示物體已經無法在任何方向上運動 (there is no possible motion that increases gap) 
	- 形式閉合只能靠幾何約束，因此對法向力的要求ㄍㄥˋ ㄍㄠ