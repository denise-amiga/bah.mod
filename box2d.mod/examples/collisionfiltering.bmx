SuperStrict

Framework BaH.Box2d
Import BRL.GLMax2D

Import "test.bmx"


Graphics 800,600, 0
SetBlend alphablend


Run(New CollisionFiltering.Create(), New TSettings)


Type CollisionFiltering Extends Test

	' This is a test of collision filtering.
	' There is a triangle, a box, and a circle.
	' There are 6 shapes. 3 large and 3 small.
	' The 3 small ones always collide.
	' The 3 large ones never collide.
	' The boxes don't collide with triangles (except if both are small).
	Const k_smallGroup:Short = 1
	Const k_largeGroup:Short = -1
	
	Const k_defaultCategory:Short = $0001
	Const k_triangleCategory:Short = $0002
	Const k_boxCategory:Short = $0004
	Const k_circleCategory:Short = $0008

	Const k_triangleMask:Short = $FFFF
	Const k_boxMask:Short = $FFFF ^ k_triangleCategory
	Const k_circleMask:Short = $FFFF


	Method Create:CollisionFiltering()
	
		Init()
	
		Local ground:b2Body
		
		Local sd:b2PolygonDef = New b2PolygonDef
		sd.SetAsBox(50.0, 10.0)

		Local bd:b2BodyDef = New b2BodyDef
		bd.SetPosition(New b2Vec2.Create(0.0, -10.0))
		ground = m_world.CreateBody(bd)
		ground.CreateShape(sd)
		
		' Small triangle
		Local triangleShapeDef:b2PolygonDef = New b2PolygonDef

		Local vertices:b2Vec2[] = New b2Vec2[3]
		vertices[0] = Vec2(-1.0, 0.0)
		vertices[1] = Vec2(1.0, 0.0)
		vertices[2] = Vec2(0.0, 2.0)

		triangleShapeDef.SetVertices(vertices)
		triangleShapeDef.SetDensity(1.0)

		triangleShapeDef.GetFilter().SetGroupIndex(k_smallGroup)
		triangleShapeDef.GetFilter().SetCategoryBits(k_triangleCategory)
		triangleShapeDef.GetFilter().SetMaskBits(k_triangleMask)

		Local triangleBodyDef:b2BodyDef = New b2BodyDef
		triangleBodyDef.SetPositionXY(-5.0, 2.0)

		Local body1: b2Body = m_world.CreateBody(triangleBodyDef)
		body1.CreateShape(triangleShapeDef)
		body1.SetMassFromShapes()


		' Large triangle (recycle definitions)
		vertices[0].Multiply(2.0)
		vertices[1].Multiply(2.0)
		vertices[2].Multiply(2.0)
		triangleShapeDef.SetVertices(vertices)
		
		triangleShapeDef.GetFilter().SetGroupIndex(k_largeGroup)
		triangleBodyDef.SetPositionXY(-5.0, 6.0)
		triangleBodyDef.SetFixedRotation(True) ' look at me!

		Local body2:b2Body = m_world.CreateBody(triangleBodyDef)
		body2.CreateShape(triangleShapeDef)
		body2.SetMassFromShapes()

		
		
		' Small box
		
		
		' Large box (recycle definitions)
		
		
		' Small circle
		
		
		' Large circle
		
		Return Self
	End Method

End Type


