import SwiftUI
import simd
import RealityKit

extension float4x4 {
    public func transform(position p: SIMD3<Float>) -> SIMD3<Float> {
        var result = self * SIMD4<Float>(x: p.x, y: p.y, z: p.z, w: 1)
        result /= result.w
        return SIMD3<Float>(result.x, result.y, result.z)
    }
}

struct Ray {
    let origin: SIMD3<Float>
    let direction: SIMD3<Float>
}

struct RaycastResult {
    let position: SIMD3<Float>
    let uv: SIMD2<Float>
    
    init?(ray: Ray, entity: HasModel) {
        let worldTransform = entity.transformMatrix(relativeTo: nil)
        
        for model in entity.model!.mesh.contents.models {
            for part in model.parts {
                let positions = part.positions.elements
                let indices = part.triangleIndices!.elements
                let uvs = part.textureCoordinates!.elements
                for i in 0..<indices.count / 3 {
                    let i0 = Int(indices[i * 3])
                    let i1 = Int(indices[i * 3 + 1])
                    let i2 = Int(indices[i * 3 + 2])
                    
                    let v0 = worldTransform.transform(position: positions[i0])
                    let v1 = worldTransform.transform(position: positions[i1])
                    let v2 = worldTransform.transform(position: positions[i2])
                    
                    let e1 = v1 - v0
                    let e2 = v2 - v0
                    let h = cross(ray.direction, e2)
                    let det = dot(e1, h)
                    if abs(det) < 1E-6 {
                        continue
                    }
                    let inv_det = 1.0 / det
                    let s = ray.origin - v0
                    let u = inv_det * dot(s, h)
                    if u < 0 || u > 1 {
                        continue
                    }
                    let q = simd_cross(s, e1)
                    let v = inv_det * dot(ray.direction, q)
                    if v < 0 || u + v > 1 {
                        continue
                    }
                    let t = inv_det * dot(e2, q)
                    if t < 1E-4 {
                        continue
                    }
                    let point = ray.origin + ray.direction * t
                    
                    let uv0 = uvs[i0]
                    let uv1 = uvs[i1]
                    let uv2 = uvs[i2]
                    let w1 = u
                    let w2 = v
                    let w0 = 1 - w1 - w2
                    let uv = uv0 * w0 + uv1 * w1 + uv2 * w2
                    
                    self.position = point
                    self.uv = uv
                    return
                }
            }
        }
        
        // The executing code only reaches this point if there are no positions
        // or uv texture coordinates, which indicates that the scene doesn't
        // contain a face mask. If it gets here, fail the initializer by
        // returning nil.
        return nil
    }
}
